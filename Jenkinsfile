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
	      
        
      }
}
