
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
		}
		steps {
			container(name: 'kaniko', shell: '/busybox/sh')  {
          			sh '''#!/busybox/sh
            				/kaniko/executor --context $WORKSPACE --verbosity debug --destination mikej091/go-discord-bro-bot:latest
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
