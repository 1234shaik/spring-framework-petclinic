pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git branch: 'artifactory', url: 'https://github.com/1234shaik/springpetclinic.git'
            }
        }
        /* stage('Maven Build') {
            steps {
                bat 'mvn clean package'
            }
        }
            
        
        stage('artifactory') {
            steps {
              script {
                def SERVER_ID = "artifactory"
                def server = Artifactory.server(SERVER_ID)
                def downloadSpec = """{
                  "files": [
                     {
                        "pattern": "C:/ProgramData/Jenkins/.jenkins/workspace/spring-pet-frame/target*.war",
                        "target": "petclinc-dev/"
                     }
                  ]
               }"""
                server.upload(downloadSpec)
            }
        }
     } */
    }
}
