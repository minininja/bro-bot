
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
    
         stage('Dependencies') {
            steps {
                echo 'Installing dependencies'
                sh 'go version'
                sh 'go get -u github.com/Necroforger/dgrouter/exrouter'
	            sh 'go get -u github.com/bwmarrin/discordgo'
            }
        }

        stage('Main') {
            steps {
                sh 'go build'
            }
        }
	
	
    }
}
