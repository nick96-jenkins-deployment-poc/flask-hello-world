pipeline {
    agent any

    environment {
	image = ''
    }

    stages {
	stage('Test') {
	    steps {
		echo 'Hello, World!'
	    }
	}

	stage('Build image') {
	    steps {
		script {
		    image = docker.build("nick96/flask-hello-world:${env.GIT_COMMIT}", "-f Dockerfile .")
		}
	    }
	}

	stage('Push') {
	    steps {
		script {
		    docker.withRegistry('', 'jenkins-nick96-dockerhub') {
			image.push()
		    }
		}
	    }
	}

	stage('Cleanup') {
	    steps {
		sh "docker rmi 'nick96/flask-hello-world:${env.GIT_COMMIT}"
	    }
	}
    }
}
