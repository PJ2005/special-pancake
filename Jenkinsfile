pipeline {
    agent any

    tools {
        maven 'Maven-3.9' 
        jdk 'JDK-25' 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Test') {
            steps {
                sh 'mvn clean test'
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh 'docker build -t student-management-app:latest .'
            }
        }
        
        stage('Docker Deploy') {
            steps {
                // Map host port 8081 to container port 8081
                sh '''
                docker rm -f student-app || true
                docker run -d -p 8081:8081 --name student-app student-management-app:latest
                '''
            }
        }
    }
}
