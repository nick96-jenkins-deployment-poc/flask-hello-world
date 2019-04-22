pipeline {
    agent any

    stages {
	stage('Test') {
	    steps {
		echo 'Hello, World!'
	    }
	}

	stage('Build') {
	    steps {
		script {
		    kubernetes.image()
			.withName('nick96/flask-hello-world')
			.build()
			.fromPath(".")
		}
	    }
	}

	stage('Push') {
	    steps {
		script {
		    kubernetes.image()
			.withName('nick96/flask-hello-world')
			.push()
			.withTag('${env.BUILD_NUMBER}')
			.toRegistry()


		    kubernetes.image()
			.withName('nick96/flask-hello-world')
			.push()
			.withTag('latest')
			.toRegistry()
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
