
pipeline {
    agent {
        kubernetes {
            yamlFile '.jenkins-pod.yaml'
        }
    }
    environment {
    	GOCACHE = "/tmp"
    }
    triggers {
        cron('H * * * *')
    }
    tools {
        go '1.13.15' 
    }
    stages {
    
    	stage('Debug') {
		steps {
			sh 'env'
		}
	}

        stage('Build') {
		steps {
			echo "Building"
			sh 'go get -u github.com/Necroforger/dgrouter/exrouter'
			sh 'go get -u github.com/bwmarrin/discordgo'
			sh 'go build'
		}
        }
	
	stage('Package') {
		steps {
			node {
				def customImage = docker.build('test:${env.BUILD_ID}', '-f Dockerfile')
			}
		}
	}

	stage('Deploy') {
		steps {
			echo "Deploying"
		}
	}

    }
}
