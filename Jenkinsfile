#!groovy

podTemplate(label: 'slave', containers: [
    containerTemplate(name: 'docker', image: 'docker:17.03.1-ce-dind', ttyEnabled: true, alwaysPullImage: true, privileged: true,
      command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
  ],
  volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {

  node('slave') {
  
    stage('Run a non-docker thing') {
      sh 'echo test'
      sh 'hostname -f'
      sh 'sleep 3'
    }
  
    stage('Run a docker thing') {
      container('docker') {
        stage 'Docker thing1'
        checkout scm
        sh 'docker info'
        app = docker.build("rmwpl/test:latest")
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

}
