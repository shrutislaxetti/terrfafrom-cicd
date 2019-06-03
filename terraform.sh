pipeline{
 agent any
stages {
   stage('test')
  {
 steps  {
	terraformInstall()
  sh '''
	sudo apt-get install unzip
	sudo wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
	sudo unzip terraform_0.11.13_linux_amd64.zip
	echo $PWD
	sudo mv terraform /var/lib/jenkins/workspace/terraform
	cd /var/lib/jenkins/workspace/terraform
	./terraform --version
	ls
	./terraform init
	./terraform plan -var access_key=${params.access_key} -var secret_key=${params.secret_key} -var mysql_username=${params.mysql_username} -var dbpassword=${params.dbpassword}
  '''
   }
  }
}}

def terraformInstall(){
    echo "terraform running on jenkins"
	echo "${params.access_key}"
}
