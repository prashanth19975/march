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
	      stage (""Deploy to TOMCAT){
		 steps{
	            deploy adapters: [tomcat9(credentialsId: 'TOMCAT', path: '', url: 'http://3.111.187.169:8080')], contextPath: 'PIPELINE-1', war: '**/*.war'
		 }
	        }      
           
      }
}
