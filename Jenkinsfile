pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/1234shaik/springpetclinic.git'
            }
        }
        stage('Maven Build') {
            steps {
                bat 'mvn clean package'
            }
        }
          
        stage ('docker image') {
            steps {
                // Build Docker image
                bat 'docker build -t image:pet C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\spring-pet-frame'
            }
        }
    }
}

