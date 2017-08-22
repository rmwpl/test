#!groovy
pipeline {
  agent {
    kubernetes {
      label 'pod'
      containerTemplate {
        name 'dind'
        image 'docker/docker:dind'
        ttyEnable true
        command 'cat'
        privileged true
      }
    }
  }
  stages {
    stage('test') {
      steps {
        container('dind') {
          sh 'docker info'
          sh 'hostname -f'
        }
      }
    }
  }
}
