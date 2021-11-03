pipeline {
  agent any
  stages {
    stage('setup') {
      steps {
        tool(name: 'go', type: 'go')
      }
    }

    stage('') {
      steps {
        sh '''go get -u github.com/Necroforger/dgrouter/exrouter
go get -u github.com/bwmarrin/discordgo
go build'''
      }
    }

  }
}