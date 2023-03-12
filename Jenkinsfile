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
	      stage ("Deploy to NEXUS") {
		steps {
		  sh "mvn deploy"	
		}
	      }     
	      stage ("BUILD DOCKER IMAGE") {
		      steps {
			  sh "docker build -t prashanth19975/my-image:1 ."     
		      }
	      }
           stage("DOCKER LOGIN AND PUSH") {
	     steps {
		 withCredentials([string(credentialsId: '815f3c6c-06c8-49a2-a240-560536964906', variable: 'DOCKER_HUB_PWD')]) {
			 sh "docker login -u prashanth19975 -p {DOCKER_HUB_PWD}"
			 sh "docker push prashanth19975/my-image:1"
		 }
	     }
	   }
	      
	   }
	      
}
