pipeline {
  agent any
  tools {
    go '1.17.2'
  }
  environment {
    GO1172MODULE = 'on'
  }
  stages {
    stage('Compile') {
      steps {
        sh 'go build'
      }
    }
  }
}
