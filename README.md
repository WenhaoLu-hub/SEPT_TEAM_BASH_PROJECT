
# SEPT_TEAM_BASH_PROJECT

## Project Description 


    Telemedicine application provides online booking services for the patient. This is a web/mobile application that can be used by anyone, allowing patients to signup, add their health information and make a profile, book an appointment with their personal doctor through a genuinely nice calendar. They can also chat with the doctor. Patients also can add their status such fever, pain and so on. Doctors (or GP) can add their availabilities, chat with their client, prescribe and manage medicine, and view their patients’ health status. The app can have super admin user to manage both types of users. We designed the home page for both the doctor and the patient, guiding them well to what they should do 


## Background

- Application : ND_Telemedicine

A medical project based on springcloud and docker.

Simulate a Scrum software design and development team that has a contract with Neighborhood Doctors as a client. 

Build a mobile project using spring boot and flutter 

Collaborating with each other to complete a project via Jira. 


## Build/Set up Environment

- Running software：
  - IntelliJ IDEA
  - Visual Studio Code
  
- API:
  - Postman
  - APIfox
  
- Deployment:
  - Docker
  
- Database:
  - MySQL

- You need a computer that can run the java Virtual Machine.

- After installing java, pull the project to your local location with the following command:
  - https://github.com/WenhaoLu-hub/SEPT_TEAM_BASH_PROJECT.git 
 
- Confirm your network and use maven to download the required dependencies.

- Set up flutter on your local machine using the command below: 

  - docker build . -t flutter_docker  

- Make sure you have installed docker on your local machine. this command takes about half an hour or so depending on your network conditions and machine performance 

- Then you can test your flutter environment: 

  - flutter doctor


## How to run project 
- Flutter 

  - docker run -i -p 8080:5000 -td flutter_docker 

  - This command binds the port 5000 configured in the container to the TCP port 8080, accessible from the browser.

## Deployment

To deploy this project run

```bash
# 1. yum package updated to the latest
yum update
# 2. Install required packages. yum-util provides yum-config-manager functionality. The other two are required by the devicemapper driver
yum install -y yum-utils device-mapper-persistent-data lvm2
# 3. Set the yum source
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# 4. Install docker and press y whenever input appears. The download is slow and time-consuming, so wait patiently
yum install -y docker-ce
# 5. Check the docker version and verify whether the verification is successful
docker -v
# 6. run docker
service docker restart
```

## Run
Run the microservices separately.


## Contributing 

Kaida Zhang（s3823450） 

Yifan Hu （s3849193）

Haochen Shi（s3843450）

Sifan Gao（s3753605） 

Wenhao Lu（s3810097） 
