pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'anil8064/java-app:latest'
    }
    stages {
        stage('Build Java Application') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat """
                docker build -t $DOCKER_IMAGE .
                docker login -u anil8064 -p Mithun678
                docker push $DOCKER_IMAGE
                """
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    bat """
                    kubectl apply -f k8s/Deployment.yaml
                    kubectl apply -f k8s/Service.yaml
                    """
                }
            }
        }
    }
}