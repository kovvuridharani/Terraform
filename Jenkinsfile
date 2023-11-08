pipeline {
   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kovvuridharani/Terraform.git']])
                        }
                    }
                }
            }
 
        stage('Plan') {
            steps {
                withAWS(credentials: '814524d5-f8bb-4d70-9dae-2ab12fb43bdf') {
                    sh 'pwd;cd terraform/ ; terraform init'
                    sh "pwd;cd terraform/ ; terraform fmt"
                    sh "pwd;cd terraform/ ; terraform validate"
                    sh "pwd;cd terraform/ ; terraform plan"
                }
            }
        }
 
        stage('Apply') {
            steps {
                withAWS(credentials: '814524d5-f8bb-4d70-9dae-2ab12fb43bdf') {
                    sh "pwd;cd terraform/ ; terraform apply --auto-approve"
                }
            }
        }
    }
 
  }
