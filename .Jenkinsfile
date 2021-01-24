
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
    tools {
        go '1.13.8' 
    }
    stages {
        stage('Build') {
		steps {
			echo "Building"
			sh 'go get -u github.com/Necroforger/dgrouter/exrouter'
			sh 'go get -u github.com/bwmarrin/discordgo'
			sh 'go build'
			sh 'mv $WORKSPACE/bro-bot $WORKSPACE/go-discord-bro-bot'
		}
        }
	
	stage('Package and push latest') {
		environment {
			PATH = "/busybox:/kaniko:$PATH"
			auth = ''
		}
		steps {
                        container(name: 'kaniko', shell: '/busybox/sh')  {
				sh '''#!/busybox/sh
					/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --verbosity trace --destination mikej091/go-discord-bro-bot:latest
				'''
                        }
		}
	}

	stage('Deploy latest') {
		steps {
			script {
				kubernetesDeploy(configs: "bot-deploy.yaml", kubeconfigId: "kubeconfig")
			}
		}
	}

	/*
	// doesn't work right now
	stage('Package and push buildnumber') {
		environment {
			PATH = "/busybox:/kaniko:$PATH"
			auth = ''
		}
		steps {
                        container(name: 'kaniko', shell: '/busybox/sh')  {
				sh '''#!/busybox/sh
					/kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --verbosity trace --destination mikej091/go-discord-bro-bot:${env.BUILD_NUMBER}
				'''
                        }
		}
	}
	*/
    }
}
