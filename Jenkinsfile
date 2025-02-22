pipeline{
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage ('Terraform Init') {
            steps{
                sh'''
                terraform init
                '''
            }
        }
        stage ('Terraform plan') {
            steps{
                sh'''
                terraform plan
                '''
            }
        }

        stage('Terraform apply') {
            steps{
                sh'''
                terraform apply -auto-approve
                '''
            }
        }

        stage('Install ansible/dependencies') {
            steps{
                script{
                    sshagent (credentials : ['SSH_PRIVATE_KEY']) {
                        sh'''
                        ANSIBLE=`terraform output | grep ANSIBLE | awk -F'"' '{print $2}'`
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE 'sudo yum install python3-pip -y ; pip3 install ansible ; pip3 install boto3'
                        '''
                    }
                }
            }
        }
    }

}