node {
    def image

    stage('Test') {
	steps {
	    echo 'Hello, World!'
	}
    }

    stage('Build image') {
	image = docker.build('nick96/flask-hello-world')
    }

    stage('Push') {
	docker.withRegistry('https://registry.hub.docker.com', 'jenkins-nick96-dockerhub') {
	    image.push("${env.GIT_COMMIT}")
	    image.push("latest")
	}
    }

    post {
	always {
	    sh "docker rmi 'nick96/flask-hello-world:${env.GIT_COMMIT}'"
	}
    }
}
