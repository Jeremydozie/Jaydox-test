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


        stage('Vulnerability Scanning') {
            steps {
                echo 'Testing...' 
                snykSecurity(
                    snykInstallation: 'snyk@latest',
                    snykTokenId: 'snyk-token',
                    failOnIssues: false,
                    monitorProjectOnBuild: true,

                )    
                script {
                    def snykCommand = "snyk test --all-projects"
                    def snykResult = sh(script: snykCommand, returnStatus: true)
                    if (snykResult == 0) {
                        echo "No vulnerabilities found."
                    } else {
                        error "Vulnerabilities found. Check Snyk report for details."
                    }
                }
            }
        }

    




//        stage('Run Snyk 0pen Source scan') {
//            steps {
//                echo 'Testing...' 
//                snykSecurity(
//                    snykInstallation: 'snyk@latest',
//                    snykTokenId: 'snyk-token',
//                    failOnIssues: false,
//                    monitorProjectOnBuild: true,
////                    additionalArguments: '--prune-repeated-subdependencies'
//                    additionalArguments: '--all-projects --debug'
//
//                )
//                
//            }
//        }
//
//        stage('Run Snyk Code Scan') {
//            steps {
//                echo 'Testing...' 
//                snykSecurity(
//                    snykInstallation: 'snyk@latest',
//                    snykTokenId: 'snyk-token',
//                    failOnIssues: false,
//                    monitorProjectOnBuild: true,
//                    additionalArguments: '--code -debug'
//
//                )
//                
//            }
//        }
//
//        
//        stage('Run Snyk IAC Scan') {
//            steps {
//                echo 'Testing...' 
//                snykSecurity(
//                    snykInstallation: 'snyk@latest',
//                    snykTokenId: 'snyk-token',
//                    failOnIssues: false,
//                    monitorProjectOnBuild: true,
//                    additionalArguments: '--iac --report -debug'
//
//                )
//                
//            }
//        }
//
//        stage('Run Snyk Container Scan') {
//            steps {
//                echo 'Testing...' 
//                snykSecurity(
//                    snykInstallation: 'snyk@latest',
//                    snykTokenId: 'snyk-token',
//                    failOnIssues: false,
//                    monitorProjectOnBuild: true,
//                    additionalArguments: '--container debian -debug'
//
//                )
//                
//            }
//        }
//    }
//}


//        stage('build && SonarQube analysis') {
//            steps {
//                withSonarQubeEnv('sonarserver') {
//                    // Optionally use a Maven environment you've configured already
//                        sh 'mvn clean package sonar:sonar'
//                    }
//                }
//            }
//
//
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

