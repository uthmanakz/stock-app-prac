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
                yes "yes" | terraform init

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

        stage('Git cloning inventory/playbook directory') {
            steps{
                script{
                    sshagent (credentials: ['SSH_PRIVATE_KEY']) {
                        sh'''
                        ANSIBLE=`terraform output | grep ANSIBLE | awk -F'"' '{print $2}'`
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE '
                        sudo yum install git -y ;
                        echo "GIT CLONING stock-app-playbook-prac DIRECTORY"
                        if [ ! -d "stock-app-playbook-prac" ] ;
                        then
                        git clone https://github.com/uthmanakz/stock-app-playbook-prac.git ;
                        else
                        cd stock-app-playbook-prac ; git pull ;
                        cd ../ ;
                        echo "stock-app-playbook-prac already exist so it has been git pulled instead" ;
                        fi
                        echo "GIT CLONING stock-app-inventory-prac DIRECTORY"
                        if [ ! -d "stock-app-inventory-prac-" ] ;
                        then
                        git clone https://github.com/uthmanakz/stock-app-inventory-prac-.git ;
                        else
                        cd stock-app-inventory-prac- ; git pull ;
                        cd ;
                        echo "stock-app-inventory-prac- directory already exist so it has been git pulled instead" ;
                        fi '
                        '''
                    }
                }
            }
        }

        stage('Running Ansible') {
            steps{
                script{
                    sshagent (credentials: ['SSH_PRIVATE_KEY']) {
                        sh'''
                        ANSIBLE=`terraform output | grep ANSIBLE | awk -F'"' '{print $2}'`
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE '
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} ;
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ;
                        ansible-playbook -i stock-app-inventory-prac-/aws_ec2.yml stock-app-playbook-prac/web-playbook.yml'
                        '''
                    }
                }
            }
        }
    }

}