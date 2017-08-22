#!groovy
pipeline {
  agent {
    kubernetes {
      label 'dind'
      containerTemplate {
        name 'dind'
        image 'billyteves/jenkinslave-dind-kubernetes'
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
