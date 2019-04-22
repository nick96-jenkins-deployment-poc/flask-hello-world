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
		sh "docker build -f Dockerfile -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
		sh "docker build -f Dockerfile -t ${env.IMAGE_NAME}:latest ."
	    }
	}

	stage('Push') {
	    steps {
		withDockerRegistry([credentialsId: 'jenkins-nick96-dockerhub', url: '']) {
		    echo "Pushing image tag '${env.IMAGE_TAG}'..."
		    sh "docker push ${env.IMAGE_NAME}:${env.IMAGE_TAG}"

		    echo "Pushing image tag 'latest'..."
		    sh "docker push ${env.IMAGE_NAME}:latest"
		}
	    }
	}

    }

    post {
	always {
	    sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
	}
    }
}
