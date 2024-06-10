Architecture
<img width="709" alt="image" src="https://github.com/hectorlopezv/cloudcamp-devops-final-project/assets/46845790/9052fb09-ca04-40b6-b9e5-d10e0dd7b6a0">


#Importants commands

#generate keys with terraform output
terraform output bastion_private_key
terraform output -raw bastion_private_key > bastion-key.pem
chmod 400 bastion-key.pem

#Connect to ec2 instance
ssh -i ./bastion-key.pem ec2-user@ec2-54-91-74-133.compute-1.amazonaws.com

###copy keys 
scp -i ./bastion-key.pem ./bastion-key.pem  ec2-user@ec2-54-91-74-133.compute-1.amazonaws.com:~