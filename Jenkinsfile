pipeline {
    agent {
        label 'mvndoc'
    }
    
    stages {
        stage('maven clean') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('docker build') {
            steps {
                sh 'docker build -t prabhucdt/sample-app .'
            }
        }
        
        stage('docker push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'prabhu-dockerhub-id', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push prabhucdt/sample-app'
                }
            }
        }    
    }
}
