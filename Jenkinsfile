pipeline {
  agent any

  stages {

    stage('Terraform Init') {
      steps {
        sh 'cd envs/prod && terraform init'
      }
    }

    stage('Terraform Plan') {
      when { changeRequest() }
      steps {
        sh 'cd envs/prod && terraform plan'
      }
    }

    stage('Terraform Apply') {
      when { branch "main" }
      steps {
        input "Approve Terraform Apply?"
        sh 'cd envs/prod && terraform apply -auto-approve'
      }
    }
  }
}

