pipeline {
    agent any

  
    stages {
        stage('SCM') {
            steps {
                git branch: 'artifactory', url: 'https://github.com/1234shaik/springpetclinic.git'
            }
        }

        stage('Maven Build') {
            steps {
                // Use the Maven settings file with credentials for the build
                withMaven(mavenSettingsConfig: 'your-maven-settings-id') {
                    bat "mvn clean deploy"
                }
            }
        }

        stage('artifact_backup') {
            steps {
                script {
                    def SERVER_ID = "artifactory"
                    def server = Artifactory.server(SERVER_ID)
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "spring-pet-frame/target/*.war",
                                "target": "petclinc-dev/"
                            }
                        ]
                    }"""
                    server.upload(uploadSpec)
                }
            }
        }
    }
}
