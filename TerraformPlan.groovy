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
      regexpFilterExpression: '^refs/pull/DEVOPS-2963-Lab1'
    )
  }
    // stages {
    //     stage('Terraform plan') {
    //         environment {
    //             lab1 = credentials('Long-Private-Key')
    //             lab1pub = credentials('	Long-public-Key')
    //         }
    //         steps {
    //             dir("lab1") {
    //                 sh '''
    //                     cp ${lab1} files/lab1
    //                     cp ${lab1pub} files/lab1.pub
    //                     terraform init
    //                     terraform validate
    //                     terraform plan
    //                 '''
    //             }
    //         }
    //     }
    // }

    stages {
        stage('Process Webhook') {
            steps {
                script {
                    // Check if it's a pull request or merge request
                    if (env.gitBranch.startsWith('refs/pull/')) {
                        // Execute pull request function
                        pullRequestFunction()
                    } else if (env.gitBranch.startsWith('refs/heads/')) {
                        // Execute merge request function
                        mergeRequestFunction()
                    }
                }
            }
        }
    }
}

def pullRequestFunction() {
    stage('Pull Request Function') {
        steps {
          sh '''
            cp ${lab1} files/lab1
            cp ${lab1pub} files/lab1.pub
            terraform init
            terraform validate
            terraform plan
          '''
        }
    }
}

def mergeRequestFunction() {
    stage('Merge Request Function') {
        steps {
          sh '''
            cp ${lab1} files/lab1
            cp ${lab1pub} files/lab1.pub
            terraform init
            terraform validate
            terraform plan
          '''
        }
    }
}
