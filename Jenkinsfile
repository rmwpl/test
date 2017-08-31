#!groovy

podTemplate(label: 'slave', containers: [
    containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, alwaysPullImage: true, privileged: true,
      command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
  ],
  volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {

  node('slave') {

    checkout scm

    sh 'git status'

    stage('Run a docker thing') {
      container('docker') {
        sh 'echo test8'
        stage 'Docker thing test'
        sh 'docker build -t rmwpl/test:latest .'
      }
    }
  
  }

}
