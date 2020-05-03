magpipeline {
    agent any

    stages {
        stage('Build') {
            agent { label 'slave' }
            steps {
                echo 'Docker image creation..'
                sh '''
                   sudo docker build -t image:2.0 .
                   sudo docker run -itd --name="server" -p 80:80 image:2.0 /bin/bash
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
