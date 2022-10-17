
# SEPT_TEAM_BASH_PROJECT

A medical project based on springcloud and docker.




## Build
- You need a computer that can run the java Virtual Machine.
- After installing java, pull the project to your local location with the following command:https://github.com/WenhaoLu-hub/SEPT_TEAM_BASH_PROJECT.git 
- Confirm your network and use maven to download the required dependencies.

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
