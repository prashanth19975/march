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
			   withCredentials([string(credentialsId:'DOCKERHUBPWD', variable:'DOCKERHUBPWD')]) {
				   sh "docker login -u prashanth19975 -p ${DOCKERHUBPWD}"		   
				   sh "docker push prashanth19975/myimage:1"   
			   }		   
		      
              }
	      }
	      stage("Deploying application as docker container") {
		      steps {
			  sshagent(['Docker_Deploymentserver']) {
		          sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.40.139 docker rm -f myimagecontainer || true"	
			  sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.40.139 docker run -d -p 8085:8080 --name myimagecontainer prashanth19975/myimage:1"
			  }
		      }
	      }
	      
	   }
	      
}
