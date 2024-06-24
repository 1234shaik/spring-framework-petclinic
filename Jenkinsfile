pipeline {
    agent any

    environment {
        // Environment variables for Artifactory
        ARTIFACTORY_SERVER_ID = 'artifactory'
        ARTIFACTORY_URL = 'http://localhost:8082/artifactory'
        ARTIFACTORY_CREDENTIALS_ID = 'jfrog-password1' // ID of the stored credentials in Jenkins
    }

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
                    // Configure Artifactory server
                    def rtServer = Artifactory.server(ARTIFACTORY_SERVER_ID)
                    rtServer.url = ARTIFACTORY_URL
                    rtServer.credentialsId = ARTIFACTORY_CREDENTIALS_ID
                    rtServer.timeout = 300

                    // Upload artifacts to Artifactory
                    def uploadSpec = """{
                        "files": [
                            {
                                "pattern": "spring-pet-frame/target/*.war",
                                "target": "petclinc-dev/"
                            }
                        ]
                    }"""
                    rtServer.upload(uploadSpec)
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
