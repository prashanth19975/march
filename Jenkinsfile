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
	  
	      stage("Deploy to Tomcat") {
		      steps{     
		      deploy adapters: [tomcat9(credentialsId: 'TOMCAT', path: '', url: 'http://65.2.29.91:8080')], contextPath: 'friends-project-1', war: '**/*.war'
              }
	      }
	   }
	      
}
