pipeline {
    agent any
    parameters {
        string(name: 'gitBranch', defaultValue: 'DEVOPS-2963-Lab1', description: 'Git Branch')
    }

    triggers {
        GenericTrigger(
            genericVariables: [
                causeString: 'Triggered on $gitBranch',
                token: 'long'
            ]
        )
    }

    stages {
        stage('Terraform plan') {
            steps {
                sh '''
                    cp -r files lab1
                    cd lab1
                    terraform init
                    terraform validate
                    terraform plan
                '''
            }
        }
    }
}