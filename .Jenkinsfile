
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
        stage('Dependencies') {
            steps {
                sh 'GOPATH=`pwd` go get ./...'
            }
        }
        stage('Main') {
            steps {
                sh 'go build'
            }
        }
    }
}
