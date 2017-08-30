#!groovy

podTemplate(label: 'slave', containers: [
    containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, alwaysPullImage: true, privileged: true,
      command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
  ],
  volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {

  node('slave') {

    def parameters = build?.actions.find{ it instanceof ParametersAction }?.parameters
    parameters.each {
      println "parameter ${it.name}:"
      println it.dump()
    }

    stage('Run a docker thing') {
      container('docker') {
        stage 'Docker thing test'
        checkout scm
        sh 'docker build -t rmwpl/test:latest .'
      }
    }
  
  }

}
