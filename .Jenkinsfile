
pipeline {
    agent {
        kubernetes {
            yamlFile '.jenkins-pod.yaml'
        }
    }
    environment {
    	GOCACHE = "/tmp"
	dockerImage = ''
	imageName = 'mikej091/go-discord-bro-bot'
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
			echo 'env'
			sh 'env'
			echo 'pwd'
			sh 'pwd'
			echo 'find'
			sh 'find / -print'
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
				sh "/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=${imageName}:${env.BUILD_ID}"
			}
		}
	}

/*
	stage('Docker Push') {
		steps {
			echo "Pushing"
			script {
				docker.withRegistry('', registryCredential) {
					dockerImage.push("$BUILD_NUMBER")
					dockerImage.push('latest')
				}
			}
		}
	}

	stage('Deploying') {
		steps {
			echo "Deploying"
		}
	}
*/
    }
}
