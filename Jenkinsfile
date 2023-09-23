pipeline {
    agent any
    stages {
        stage('code compile') {
            steps {
               //sh '/home/centos/maven/bin/mvn clean package'
               //sh '/home/centos/maven/bin/mvn  package'
               print 'OK'
            }
        }
        stage('test cases') {
            steps {
               //sh '/home/centos/maven/bin/mvn test'
               print 'OK'
            }
        }
        stage('code quality') {
            //parameters {
            //    password(name: 'SONAR.PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
            //}
            steps {
               // sh 'sonar qube  maven java command'
               print 'OK'
            }
        }
        stage('code security') {
            when {
                expression { env.BRANCH_NAME == "main" }
            }
            steps {
               //sh 'checks with SAST & SCA'
               print 'OK'
            }
        }
        stage('Release') {
            when {
                expression { env.TAG_NAME ==~ ".*"}
            }
            //parameters {
            //    password(name: 'NEXUS.PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
            //}
            steps {
               //sh 'Upload artifact to nexus repo'
               print 'OK'
            }
        }
    }
}