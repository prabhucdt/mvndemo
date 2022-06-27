pipeline {
    agent {
        label 'maven'
    }
    
    stages {
        stage('maven clean') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('docker build') {
            steps {
                sh 'docker build -t Northstar:latest .'
            }
        }
        
        stage('docker build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'd06b6e42-4782-4848-8322-49b920ce9754', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push Northstar:latest'
                }
            }
        }    
    }
}
