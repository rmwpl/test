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
      containerTemplate {
        name 'slave'
        image 'jenkinsci/jnlp-slave:3.10-1'
        ttyEnable true
        command 'cat'
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
