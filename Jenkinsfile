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

    println "DEBUG: tag is |${env.TAG}|"
    if (env.TAG != '<null>') {
      println "tag provided"
        def tag = TAG.reverse().take(TAG.reverse().indexOf('/')).reverse()
        // checkout([$class: 'GitSCM', branches: [[name: "refs/tags/${tag}"]], doGenerateSubmoduleConfigurations: false])
        checkout scm
        sh """
          echo test
          git ls-remote
          git checkout ${env.TAG}
          git status
        """
    } else {
      println "no tag provided"
      checkout scm
    }

    sh 'git status'

    stage('Run a docker thing') {
      container('docker') {
        stage 'Docker thing test'
        sh 'docker build -t rmwpl/test:latest .'
      }
    }
  
  }

}
