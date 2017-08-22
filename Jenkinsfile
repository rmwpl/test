#!groovy

podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, alwaysPullImage: true, privileged: true,
      command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
  ],
  volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {

    node ('mypod') {
        stage 'Run a non-docker thing'
        sh 'hostname -f'
        stage 'Run a docker thing'
        container('docker') {
            stage 'Docker thing1'
            sh 'docker info'
            app = docker.build("rmwpl/test:latest")
            stage 'docker exec'
            app.inside {
              sh 'ls -alh'
            }
        }

    }
  }
