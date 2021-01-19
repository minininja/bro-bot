pipeline {
    agent any
    tools {
        go 'go-1.13.8'
    }
    environment {
        GO111MODULE = 'on'
    }
    stages {
        state('Compile') {
	        steps {
	        	sh "go build"
	        }
        }
    }
}
