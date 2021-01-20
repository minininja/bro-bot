
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
        stage('Main') {
            steps {
                sh 'GOPATH=`pwd` go get ./...'
                sh 'go build'
            }
        }
    }
}
