//pipeline {
//    agent any
//    environment {
//        AWS_DEFAULT_REGION = 'your_aws_region'
//        ECR_REPOSITORY = 'your_ecr_repository_url'
//        DOCKER_IMAGE_TAG = 'latest'
//    }
//    stages {
//        stage('Build') {
//            steps {
//                script {
//                    sh 'docker build -t jaydox-image .'
//                }
//            }
//        }
//        stage('Push to ECR') {
//            steps {
//                script {
//                    withCredentials([string(credentialsId: 'your_aws_credentials_id', variable: 'AWS_CREDENTIALS')]) {
//                        sh 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY'
//                        sh 'docker tag your_image_name:$DOCKER_IMAGE_TAG $ECR_REPOSITORY:latest'
//                        sh 'docker push $ECR_REPOSITORY:latest'
//                    }
//                }
//            }
//        }
//    }
//}




pipeline {
    agent any


    stages {
        
        
        stage('Build and Tag Image') {
            steps {
                script {
                app = docker.build("210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox:${BUILD_NUMBER}")
                }
            }
        }
        
        stage('Push image to ECR...') {
            steps {
                script {
                docker.withRegistry("https://210624171893.dkr.ecr.us-east-1.amazonaws.com/cokafor", "ecr:us-east-1:aws-credential") {
                app.push()
                app.push('latest')
                }
                }
            }
        }
    }
}
