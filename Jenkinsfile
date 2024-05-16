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
                bat 'mvn install'
            }
        }
        stage('SonarQube Analysis') {
            steps {
               bat ''' mvn clean verify sonar:sonar \
                   -Dsonar.projectKey=petclinct \
                   -Dsonar.projectName='petclinct' \
                   -Dsonar.host.url=http://localhost:8000 \
                   -Dsonar.token=sqp_914e9967ecf088d5d353779e64104a9c1b9da9e6 '''
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
