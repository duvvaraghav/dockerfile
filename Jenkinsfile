pipeline {
    agent any

    stages {
        stage('Build') {
            agent { label 'slave' }
            steps {
                echo 'image creation..'
                sh '''
                   amiName=$(date "%s")
                   echo $amiName
                   sudo docker build -t image:$amiName .
                   sudo docker images
                '''
            }
        }
    }		
    post {
        failure {
            script {
                currentBuild.result = 'FAILURE'
            }
        }

        always {
            step([$class: 'Mailer',
                notifyEveryUnstableBuild: true,
                recipients: "duvva.raghavendra@gmail.com",
                sendToIndividuals: true])
        }     
    }       
}
