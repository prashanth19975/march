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
      }
}
