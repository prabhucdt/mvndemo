pipeline { 
    environment { 
        registry = "prabhucdt/prabhucdt" 
        registryCredential = 'prabhu-dockerhub-id' 
        dockerImage = '' 
    }
    agent {
        label 'maven'
    }
    stages { 
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }        
        stage('Build docker image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Push docker image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
    }
}
