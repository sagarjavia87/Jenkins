node {
        //git checkout
   stage('SCM Checkout'){
   	  git 'https://github.com/kuberguy/helloworld'
   }
   stage('Mvn Package'){
        //Maven compile
   	def mvnHome = tool name: 'maven-3', type: 'maven'
   	def mvnCMD = "${mvnHome}/bin/mvn"
   	sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
        //Building Docker image
   	sh 'docker build -t sagarjavia87/hello-world:2.0.0 .'

   }
   stage('Push Docker Image'){
        //Pushing Dockerimage to DockerHub
   	withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
       sh "docker login -u sagarjavia87 -p ${dockerHubPwd}"
   }
   	sh 'docker push sagarjavia87/hello-world:2.0.0 '
   }
   stage('Run container on Server'){
        //spinning up Docker container with port 8090:8080
   	  sh 'docker run -p 8090:8080 -d --name my-app sagarjavia87/hello-world:2.0.0'
   }
   stage('Deployment to K8S'){
        //Deploying it to K8S cluster
        IMAGE="sagarjavia87/hello-world:2.0.0"
        kubectl set image deployment/sagarjavia87/hello-world:2.0.0
   }
}
