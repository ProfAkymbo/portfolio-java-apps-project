# portfolio-java-apps-project
Design and implementation of a complete DevOps pipeline to deploy and manage two different applications using Infrastructure as Code (IaC), configuration management, and CI/CD automation.


cd my-portfolio
run python3 app.py

docker build -t portfolio-app .
docker run -d -p 5000:5000 --name my-portfolio-container portfolio-app

## Build and run the java app
docker build -t java-app ./java-app
docker run -d -p 8080:8080 --name java-container java-app
