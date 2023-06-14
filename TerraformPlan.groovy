/* groovylint-disable LineLength */
/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    parameters {
        string(name: 'gitBranch', defaultValue: 'DEVOPS-2963-Lab1', description: 'Git Branch')
    }

    triggers {
        GenericTrigger(
      genericVariables: [
        /* groovylint-disable-next-line DuplicateStringLiteral */
        [key: 'gitBranch', value: '$.ref'],
      ],

      causeString: 'Triggered on $gitBranch',

      token: 'long',

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
                lab1pub = credentials('Long-public-Key')
            }
            steps {
                dir('lab1') {
                    // sudo rm -rf files
                    /* groovylint-disable-next-line GStringExpressionWithinString */
                    sh '''
                      sudo rm -rf files
                      mkdir files
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

    environment {
        // trainee_webhook_token = credentials('trainee-slack-token')
        slackBaseUrl = 'https://nfq-international.slack.com/'
        slackTeamDomain = 'nfq-international'
        slackChannel = 'alerts'
        slackTokenCredentialId = '210ab3f8-018b-4bbd-b2d9-e99e1654d357'
        slackColor = 'good'
        slackBotUser = false
        slackIconEmoji = ':rocket:'
        slackUsername = 'Jenkins'
        slackTimestamp = true
    }

    post {
        withCredentials([string(credentialsId: 'trainee-slack-token', variable: 'SECRET')])
        always { 
            slackSend(
            token: '${SECRET}',
            baseUrl: slackBaseUrl,
            teamDomain: slackTeamDomain,
            channel: slackChannel,
            color: slackColor,
            botUser: slackBotUser,
            tokenCredentialId: slackTokenCredentialId,
            notifyCommitters: false,
            iconEmoji: slackIconEmoji,
            username: slackUsername,
            timestamp: slackTimestamp,
            message: 'Hello World'
        )}
    }
}
