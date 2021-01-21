
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
			SECRET = credentials('dockerhub-auth')
		}
		steps {
			// sh 'env'
			// sh 'sleep 3600'
			container(name: 'kaniko', shell: '/busybox/sh')  {
				creds = sh 'echo -n $SECRET | base64'
				def config = [
					auths: [
						"https://index.docker.io/v1":  creds
					]
				]
				writeJSON file: "${WORKSPACE}/config.json", json: config
				sh 'cat $WORKSPACE/config.json'
				// sh 'sleep 3600'
				sh '''#!/busybox/sh
					export DOCKER_CONFIG=${WORKSPACE}
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
