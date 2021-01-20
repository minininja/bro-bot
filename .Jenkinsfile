pipeline {
    agent { kubernetes { image 'golang:1.14-alpine3.11' } }
    stages {
        stage("build") {
            steps {
                go build
            }
        }
    }
}
