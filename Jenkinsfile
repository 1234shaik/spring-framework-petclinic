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
                // Use local Maven settings.xml file for the build
                bat "mvn clean package --settings C:\\Users\\aslam\\.m2\\settings.xml"
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
    

    post {
        always {
            archiveArtifacts artifacts: 'spring-pet-frame/target/*.war', allowEmptyArchive: true
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
