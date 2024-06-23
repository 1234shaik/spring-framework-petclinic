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
          
        stage ('tomcat') {
          steps {
                bat 'copy C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\spring-pet-frame\\target\\*.war C:\\paths\\apache-tomcat-10.1.24\\webapps'
            }
        }
    }
}