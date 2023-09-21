pipeline {
    agent any

    stages {
        stage('compile code') {
            steps {
                //sh '/home/centos/maven/bin/mvn clean package'
                //sh '/home/centos/maven/bin/mvn  package'
                echo 'Hello World'
            }
        }
        stage('test') {
            steps {
                //sh '/home/centos/maven/bin/mvn test'
                echo 'Hello World'
            }
        }
        stage('code quality') {
            steps {
                // sh 'sonar qube  maven java command'
                echo 'Hello World'
            }
        }
        stage('code security') {
            when {
                expression { env.BRANCH_NAME == "main" }
            }
            steps {
                echo 'we go there'
            }
        }
        stage('Release') {
            when {
                expression { env.TAG_NAME ==~ ".*" }
            }
            steps {
                echo 'Hello World'
            }
        }
    }
}