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
        echo "Building"
        sh 'go get -u github.com/Necroforger/dgrouter/exrouter'
        sh 'go get -u github.com/bwmarrin/discordgo'
        sh 'go build'
        sh 'mv $WORKSPACE/bro-bot $WORKSPACE/go-discord-bro-bot'
      }
    }
  }
}
