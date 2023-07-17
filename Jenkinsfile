pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        ECR_REPOSITORY = '210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox'
        DOCKER_IMAGE_TAG = 'latest'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t jaydox .'
                }
            }
        }


        stage('Push image to ECR...') {
            steps {
                script {
                docker.withRegistry("https://210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox", "ecr:us-east-1:aws-access-jenkins") {
                sh 'docker tag jaydox:$DOCKER_IMAGE_TAG $ECR_REPOSITORY:latest'
//                sh 'docker tag jaydox:latest 210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox:latest'
//                sh 'docker push 210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox:latest'
                sh 'docker push $ECR_REPOSITORY:latest'
                }
                }
            }
        }
    }
}






