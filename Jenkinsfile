pipeline {
    stages {
	stage('Test') {
	    steps {
		echo 'Hello, World!'
	    }
	}

	stage('Push') {
	    steps {
		script {
		    def imageName = "nick96/flask-hello-world"
		    docker.build(imageName).push("${env.GIT_COMMIT}")
		    docker.build(imageName).push("latest")
		}
	    }
	}

    }
    post {
	always {
	    sh "docker rmi 'nick96/flask-hello-world'"
	}
    }
}
