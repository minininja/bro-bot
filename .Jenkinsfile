
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
        stage('Build') {
		steps {
			echo "Building"
			// sh 'env'
			sh 'go get -u github.com/Necroforger/dgrouter/exrouter'
			sh 'go get -u github.com/bwmarrin/discordgo'
			sh 'go build'
			sh 'mv $WORKSPACE/bro-bot $WORKSPACE/go-discord-bro-bot'
			sh 'ls -l'
		}
        }
	
	stage('Package and Push') {
		environment {
			PATH = "/busybox:/kaniko:$PATH"
			DOCKER_CONFIG=/tmp/config.json
		}
		steps {
			// sh 'env'
			// sh 'sleep 3600'
			container(name: 'kaniko', shell: '/busybox/sh')  {
				withCredentials([string(credentialsId: 'dockerhub-auth', variable: 'dockerhubauth')]) {
					writeFile file: "/tmp/config.json", text: '{ "auths": { "https://index.docker.io/v1/": { "auth": "${dockerhubauth}" } } }'
				}
				sh 'cat /tmp/config.json'
          			sh '''#!/busybox/sh
            				/kaniko/executor --dockerfile $WORKSPACE/Dockerfile --context $WORKSPACE --verbosity trace --destination mikej091/go-discord-bro-bot:latest
          			'''
			}
		}
	}

	stage('Deploying') {
		steps {
			echo "Deploying"
		}
	}

    }
}
