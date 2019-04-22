pipeline {
    agent any

    environment {
	IMAGE_NAME = "nick96/flask-hello-world"
	IMAGE_TAG = "${env.GIT_COMMIT}"
    }

    stages {
	stage('Test') {
	    steps {
		echo 'Hello, World!'
	    }
	}

	stage('Build') {
	    steps {
		echo "Building image..."
		sh "docker build -f Dockerfile -t ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
	    }
	}

	stage('Push') {
	    steps {
		echo "Pushing image tag ${env.IMAGE_TAG}..."
		withDockerRegistry([credentialsId: 'jenkins-nick96-dockerhub', url: '']) {
		    sh "docker push ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
		    sh "docker push ${env.IMAGE_NAME}:latest"
		}
	    }
	}

    }

    post {
	always {
	    sh "docker rmi nick96/flask-hello-world"
	}
    }
}
