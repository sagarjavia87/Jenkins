node {
   stage('SCM Checkout'){
   	  git 'https://github.com/kuberguy/helloworld'
   }
   stage('Mvn Package'){
   	def mvnHome = tool name: 'maven-3', type: 'maven'
   	def mvnCMD = "${mvnHome}/bin/mvn"
   	sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
   	sh 'docker build -t sagarjavia87/my-app:4.0.0 .'

   }
   stage('Push Docker Image'){
   	withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
       sh "docker login -u sagarjavia87 -p ${dockerHubPwd}"
   }
   	sh 'docker push sagarjavia87/my-app:4.0.0 '
   }
   stage('Run container on Server'){
   	  sh 'docker run -p 82:82 -d --name my-app sagarjavia87/my-app:4.0.0'
   }
}
