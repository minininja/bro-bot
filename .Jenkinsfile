
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
			auth = ''
		}
		steps {
                        container(name: 'kaniko', shell: '/busybox/sh')  {
				withCredentials([string(credentialsId: 'dockerhub-auth', variable: 'dockerauth')]) {
					echo 'preparing to package, creating config file'
					script {
						auth = sh returnStdout: true, script: 'echo -n $dockerauth | base64'
						writeFile file: 'config.json', text: "{ \"auths\": { \"https://index.docker.io/v1\": \"${auth.trim()}\" } }"
					}
					echo 'creating container'
					sh "/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=mikej091/app:${env.BUILD_ID}"
				}
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
