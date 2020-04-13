pipeline {
    agent any

    stages {
        stage('CleanOldBinary') {
            steps {
               catchError {
                 sh 'rm -rf webapps/dist'
                 sh 'rm -rf .stack-work'
                 sh 'docker stop auth-provider'
                 sh 'docker rm auth-provider'
                 sh 'docker images -a | grep "auth-provider" | awk \'{print $3}\' | xargs docker rmi'
               }
            }
        }
        stage('Build') {
            steps {
                sh 'stack build --copy-bins --local-bin-path target'
            }
        }
        stage('DockerBuildImage') {
            steps {
                echo 'Starting to build docker image'
                script {
                    def customImage = docker.build("auth-provider:1.0")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                script {
                    docker.image("auth-provider:1.0")
                    .run('--name auth-provider --net=host '
                        + '-e DB_USER=inventory_user '
                        + '-e DB_PASSWORD=inventory_password '
                        + '-e DB_HOST=192.168.0.107 '
                        + '-e DB_DATABASE=inventory_db'
                    )
                }
            }
        }
    }
}
