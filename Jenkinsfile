pipeline {
 agent any
   environment {
    registry = "ravikodavatiganti/spring3-mvc-maven-xml-hello-world-jmsth-40-docker"
    registryCredential = 'dockerhub_credentials'
    dockerImage = ''
  }
  stages {
    stage('get scm') {
      steps {
	  git credentialsId: 'github_cred', url: 'https://github.com/ravikodavatiganti/spring3-mvc-maven-xml-hello-world.git'
       }
    }
	stage('mavenbuild'){
	   steps{
	    sh 'mvn package'
	   }
	   }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('push image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove old docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
