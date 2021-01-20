
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
			// echo 'pwd'
			// sh 'pwd'
			// echo 'find'
			// sh 'find / -print'
		}
	}

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
	
	stage('Package') {
		steps {
			container(name: 'kaniko', shell: '/busybox/sh')  {
				sh '/kaniko/executor --context $WORKSPACE --verbosity debug --destination=${imageName}:${env.BUILD_ID}'
			}
			/*
			script {
				sh "/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=${imageName}:${env.BUILD_ID}"
			}
			*/
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
