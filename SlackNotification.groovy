pipeline {
    agent any
    environment {
        trainee_webhook_token = credentials('trainee-slack-token')
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

    stages {
        stage('Build') {
            steps {
                build job: 'Jenkin-pipeline-long-plan', wait: true, propagate: false
            }
        }
    }
    post {
        always {
            slackSend (
                token: env.trainee_webhook_token,
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
            )
        }
    }
}