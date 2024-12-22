pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "anil8064/java-app:latest"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/polagonianil/java-application-k8s.git', branch: 'main'
            }
        }
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
                sh """
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                """
            }
        }
    }
}
