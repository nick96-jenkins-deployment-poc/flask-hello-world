pipeline {
    agent any

    stages {
	stage('Test') {
	    steps {
		echo 'Hello, World!'
	    }
	}

	stage('Push') {
	    steps {
		script {
		    kubernetes.image()
			.withName('nick96/flask-hello-world')
			.push()
			.withTag('${env.GIT_COMMIT}')
			.toRegistry()
		}
	    }
	}

    }

    post {
	always {
	    sh "docker rmi nick96/flask-hello-world:${env.BUILD_NUMBER}"
	}
    }
}
