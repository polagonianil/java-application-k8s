pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "<your-dockerhub-username>/java-app:latest"
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Java Application') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t $DOCKER_IMAGE .
                docker login -u <your-dockerhub-username> -p <your-dockerhub-password>
                docker push $DOCKER_IMAGE
                """
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh """
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                """
            }
        }
    }
}
