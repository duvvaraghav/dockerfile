pipeline {
    agent any

    stages {
        stage('Build') {
            agent { label 'slave' }
            steps {
                echo 'image creation..'
                sh '''
                   sudo docker build -t image:3.0 .
                   sudo docker run -itd --name="test1"  image:3.0 /bin/bash
                   sudo docker ps -a
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
