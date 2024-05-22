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
                bat 'mvn package'
            }
        }
         stage('SonarQube Analysis') {
            steps {
               bat ''' mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=spring_petclinic \
                    -Dsonar.projectName='spring_petclinic' \
                    -Dsonar.host.url=http://localhost:9000 \
                    -Dsonar.token=sqp_945e2edf79caf907bbfcc492439e24522b78b0b4 '''
                   }
                }
         /* stage('SonarQube code Analysis') {
            steps {
               bat ''' mvn clean verify sonar:sonar \
                     -Dsonar.projectKey=frame-pet \
                     -Dsonar.projectName='frame-pet' \
                     # -Dsonar.host.url=http://localhost:8000 \
                     -Dsonar.token=sqp_ecb6af01fb584c2a4c308a3346dc94b9da58b3a1 '''
                   }
                }
        
           stage('Quality Gates') {
            steps {
                bat ''' timeout(time: 1, unit: 'HOURS') {
                    // Wait for Quality Gate to be computed
                    waitForQualityGate abortPipeline: true '''
                }
            }
        } */
    stage('artifactory') {
    steps {
        script {
            def SERVER_ID = "artifactory"
            def server = Artifactory.server(SERVER_ID)
            def downloadSpec = """{
                "files": [
                    {
                        "pattern": "C:/ProgramData/Jenkins/.jenkins/workspace/spring-pet-frame/target*.jar",
                        "target": "example-repo-local/"
                    }
                ]
            }"""
            server.upload(downloadSpec)
        }
    }
}
}
}

    




/* pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
              git branch: 'main', url: 'https://github.com/1234shaik/springpetclinic.git'
            }
        }
        stage ('Maven Build') {
            steps {
                bat 'mvn install'
            }
        }
        stage('SonarQube Analysis') {
            steps {
              def mvn = tool 'Default Maven';
             withSonarQubeEnv() {
            bat "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=petclinct -Dsonar.projectName='petclinct'"
    }
    }
  }                
    }
} */

/* pipeline {
    agent any
    stages {
        stage ("scm") {
            steps {
                git ' https://github.com/1234shaik/spring-framework-petclinic.git '
            }
        }
    }
} */
