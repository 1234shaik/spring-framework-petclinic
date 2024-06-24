pipeline {
    agent any

    environment {
        ARTIFACTORY_SERVER_ID = 'artifactory'
        ARTIFACTORY_URL = 'http://localhost:8081/artifactory'
        ARTIFACTORY_USERNAME = 'admin' // Default admin username
        ARTIFACTORY_PASSWORD = 'password' // Default admin password, change accordingly
        ARTIFACTORY_CREDENTIALS_ID = 'jfrog-password1'
    }

    stages {
        stage('SCM') {
            steps {
                git branch: 'artifactory', url: 'https://github.com/1234shaik/springpetclinic.git'
            }
        }

        stage('Maven Build') {
            steps {
                configFileProvider([configFile(fileId: 'your-settings-xml-id', variable: 'MAVEN_SETTINGS')]) {
                    bat "mvn clean package --settings $MAVEN_SETTINGS"
                }
            }
        }

        stage('artifact_backup') {
            steps {
                script {
                    def rtServer = Artifactory.server ARTIFACTORY_SERVER_ID
                    rtServer.url = ARTIFACTORY_URL
                    rtServer.credentialsId = ARTIFACTORY_CREDENTIALS_ID
                    rtServer.timeout = 300

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
