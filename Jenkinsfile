pipeline {
  agent any

  stages {

    stage('Terraform Init') {
      steps {
        sh 'cd envs/prod && terraform init'
      }
    }

    stage('Terraform Plan') {
      when {
        changeRequest()
      }
      steps {
        sh 'cd envs/prod && terraform plan'
      }
    }

    stage('Terraform Apply') {
      when {
        allOf {
          branch 'main'
          not { changeRequest() }
        }
      }
      steps {
        input message: 'Approve Terraform Apply?'
        sh 'cd envs/prod && terraform apply -auto-approve'
      }
    }
  }
}
