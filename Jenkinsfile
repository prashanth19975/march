pipeline {
   agent any
      stages{
	      stage ('git clone') {
               steps {
               git 'https://github.com/prashanth19975/march.git'
             }
             }
	      stage (" mvn --version") {
	        steps {     
		   sh "mvn --version"  
		}
	        }      
	      stage ("maven build") {
	        steps {
	           sh "mvn clean compile test package"		
		}
	        }      
	      stage ("Deploy to Nexus") {
		 steps {
		   sh "mvn deploy"
	       }
	       }
	  
	      stage("Build docker image") {
		      steps {
			 sh "docker build -t prashanth19975/myimage:1 ."   
		      }
	              }
			      
	      stage("Docker Login and Push") {
		      steps {
			   withCredentials([string(credentialsId: '815f3c6c-06c8-49a2-a240-560536964906', variable: 'DOCKER-HUB-PWD')]) {
				   sh "docker login -u prashanth19975 -u ${DOCKER-HUB-PWD}"		   
				   sh "docker push prashanth19975/myimage:1"   
			   }		   
		      
              }
	      }
	   }
	      
}
