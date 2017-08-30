#!groovy

properties([[$class: 'ParametersDefinitionProperty', parameterDefinitions: [
  [$class: 'StringParameterDefinition', name: 'TAG', defaultValue: '<null>', description: 'TAG when building from a tag']
]]])

podTemplate(label: 'slave', containers: [
    containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, alwaysPullImage: true, privileged: true,
      command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
  ],
  volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {

  node('slave') {

    println "DEBUG: tag is |${params.TAG}|"
    if (params.TAG) {
      println "tag provided"
    } else {
      println "no tag provided"
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
