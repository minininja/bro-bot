
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
			script {
				docker.build("mikej091/go-discord-bro-bot:${env.BUILD_ID}")
				// docker.build("mikej091/go-discord-bro-bot:latest")
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
