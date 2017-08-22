#!groovy
node {
  try {
    deleteDir()
    def app
    stage('checkout') {
      checkout scm
    }
    stage('build') {
      // comment
      app = docker.build("debian/stretch")
    }
    stage('docker exec') {
      app.inside {
        sh 'ls -la'
      }
    }
  } catch (e) {
    throw e
  }
}

