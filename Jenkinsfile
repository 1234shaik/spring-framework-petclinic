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
                 steps {
                   script {
                    bat 'mvn clean verify sonar:sonar -Dsonar.projectKey=petclinct -Dsonar.projectName=\'petclinct\''
                   }
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
