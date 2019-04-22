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
		    def imageName = "nick96/flask-hello-world"
		    def image = docker.build("${imageName}:${env.BUILD_NUMBER}")

		    echo "Built image"

		    image.push("${env.BUILD_NUMBER}")

		    echo "Pushed tagged"

		    image.push("latest")

		    echo "pushed latest"
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
