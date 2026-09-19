pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-build:v1 .'
            }
        }

        stage('Run Application') {
            steps {
                sh 'docker run -d --name devops-build -p 3000:80 devops-build:v1'
            }
        }

    }
}
