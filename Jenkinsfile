//pipeline {
//    agent any
//    environment {
//        AWS_DEFAULT_REGION = 'us-east-1'
//        ECR_REPOSITORY = '210624171893.dkr.ecr.us-east-1.amazonaws.com/jaydox'
//        DOCKER_IMAGE_TAG = 'latest'
//    }
//    stages {
//        stage('Build') {
//            steps {
//                script {
//                    sh 'sudo -Adocker build -t jaydox .'
//                }
//            }
//        }
//        stage('Push to ECR') {
//            steps {
//                script {
//                    withCredentials([string(credentialsId: 'aws-credential', variable: 'AWS_CREDENTIALS')]) {
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