#!groovy

node ('jenkins-slave') {

  stage('Run a non-docker thing') {
    sh 'echo test'
    sh 'hostname -f'
    sh 'sleep 3'
  }

  stage('Run a docker thing') {
    container('docker') {
      stage 'Docker thing1'
      checkout scm
      // sh 'sleep 120'
      sh 'docker info'
      // app = docker.build("rmwpl/test:latest")
      // stage 'docker exec'
      // app.inside {
      //   sh 'ls -alh'
      // }
    }
  }

  stage('debug sleep') {
    sh 'sleep 120'
  }

}
