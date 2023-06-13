pipeline {
    agent any
    parameters {
        string(name: 'gitBranch', defaultValue: 'DEVOPS-2963-Lab1', description: 'Git Branch')
    }

  triggers {
    GenericTrigger(
      genericVariables: [
        [key: 'gitBranch', value: '$.ref'],
      ],

      causeString: 'Triggered on $gitBranch',

      token: "long",

      printContributedVariables: true,
      printPostContent: true,

      silentResponse: false,

      regexpFilterText: '$gitBranch',
      regexpFilterExpression: '^refs/heads/DEVOPS-2963-Lab1'
    )
  }

    stages {
        stage('Terraform plan') {
            environment {
                lab1 = credentials('Long-Private-Key')
                lab1pub = credentials('	Long-public-Key')
            }
            steps {
                dir("lab1") {
                    sh '''
                        ls -la
                        cp ${lab1} files/lab1
                        cp ${lab1pub} files/lab1.pub
                        terraform init
                        terraform validate
                        terraform plan
                    '''
                }
            }
        }
    }
    // Long
}

