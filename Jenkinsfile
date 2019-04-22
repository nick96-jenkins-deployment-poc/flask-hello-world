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

	stage('Push') {
	    steps {
		script {
		    def image = docker.build("nick96/flask-hello-world:${env.GIT_COMMIT}")

		    docker.withRegistry('', 'jenkins-nick96-dockerhub') {
			image.push()
		    }
		}
	    }
	}
    }

    post {
	always {
	    sh "docker rmi 'nick96/flask-hello-world:${env.GIT_COMMIT}'"
	}
    }
}
