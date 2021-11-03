pipeline {
  agent any
  stages {
    stage('setup') {
      steps {
        tool(name: '1.17.2', type: 'go')
      }
    }

    stage('error') {
      steps {
        sh '''go get -u github.com/Necroforger/dgrouter/exrouter
go get -u github.com/bwmarrin/discordgo
go build'''
      }
    }

  }
}