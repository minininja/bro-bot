
pipeline {
    agent {
        kubernetes {
            yamlFile '.jenkins-pod.yaml'
        }
    }
    triggers {
        cron('H * * * *')
    }
    tools {
        go '1.13.15' 
    }
    stages {
    
         stage('Pre Test') {
            steps {
                echo 'Installing dependencies'
                sh 'go version'
                sh 'go get -u'
            }
        }
/*
        stage('Dependencies') {
            steps {
                sh 'GOPATH=`pwd` go get ./...'
            }
        }
*/
        stage('Main') {
            steps {
                sh 'go build'
            }
        }
    }
}
