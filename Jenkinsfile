pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-build:v1 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh '''
                        echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
                        docker tag devops-build:v1 $DOCKERHUB_USERNAME/prod:v1
                        docker push $DOCKERHUB_USERNAME/prod:v1
                        docker logout
                    '''
                }
            }
        }

        stage('Run Application') {
            steps {
                sh '''
                    docker rm -f devops-build || true
                    docker run -d --name devops-build -p 3000:80 devops-build:v1
                '''
            }
        }

    }
}