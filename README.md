# portfolio-java-apps-project
Design and implementation of a complete DevOps pipeline to deploy and manage two different applications using Infrastructure as Code (IaC), configuration management, and CI/CD automation.

## Build and run apps locally
cd my-portfolio
run python3 app.py

docker build -t portfolio-app .
docker run -d -p 5000:5000 --name my-portfolio-container portfolio-app

## Build and run the java app
docker build -t java-app ./java-app
docker run -d -p 8080:8080 --name java-container java-app

## Let's provision infra with Terraform

Setup AWS credentials and run from `terraform/`:

```bash
cd terraform
terraform init
terraform validate  
terraform plan   
terraform apply -auto-approve
```

### Terraform variables

The Terraform configuration supports:

- `aws_region`
- `instance_type`
- `aws_ami`
- `ssh_key_name`

## Finally let's replicate everything with fully automated GitHub Actions CI/CD

The workflow is defined in `.github/workflows/ci-cd.yml`.

It performs:

1. checkout code
2. install dependencies
3. run tests
4. build Docker image
5. push image to DockerHub
6. run Terraform provision
7. deploy the container to EC2 via SSH

## Required GitHub Secrets

Add the following secrets to your repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`  
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `TF_VAR_KEY_NAME`  for keypair name  
- `EC2_SSH_KEY` for ssh private key  

## Commit and push the repo  

Go to Github to see the pipeline progress  

## Access the app

After deployment, visit:

```text
http://<EC2_PUBLIC_IP>:5000
```

```text
http://<EC2_PUBLIC_IP>:8080
```


Replace `<EC2_PUBLIC_IP>` with the public IP of the EC2 instance.
