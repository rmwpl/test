#!groovy
pipeline {
  agent {
    kubernetes {
      label 'pod'
      containerTemplate {
        name 'dind'
        image 'docker:dind'
        ttyEnable true
        command 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay'
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
