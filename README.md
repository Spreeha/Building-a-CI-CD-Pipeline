[![Python application test with Github Actions](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/actions/workflows/main.yml)

# Overview
This project demoes building CI/CD pipelines with .
A Machine Learning web application is built, test, and deployed using Github Actions and Azure pipelines.

## Project Plan
<TODO: Project Plan

* Trello board - 
The [yearly project plan](../../raw/main/projectplan/project-plan_2021.xlsx) shows how important automation is in the project plan.

The [quarterly project plan](../../raw/main/projectplan/project-plan_2021_Q2.xlsx) shows the steps for building the CI-CD pipeline and other estimate details

The [Trello board](https://trello.com/b/ppxOVR52/ml-application) is then used for task planning and tracking.

## Instructions

  
![Architecture](architecture/Architecture.png "Architecture")

* Project running on Azure App Service
Install the app to Azure app services using the free tier:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ az webapp up -n flask-sklearn --sku F1
```

![Install to Azure app services](screenshots/S5-az-webapp-up.PNG "Install to Azure app services")


![Running webapp](screenshots/S6-webapp-running.PNG "Running webapp")

Edit file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. testapp98).

Test the remote webapp:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ ./make_predict_azure_app.sh
```
![Test remotely](screenshots/S7-make_predict_azure_app.sh.PNG "Test remotely")

Logs of your running webapp can be accessed in two ways:

Via your cloud shell as a stream:
```bash
(.flask-sklearn) azureuser@Azure:~/testapp98$ az webapp log tail
```
![Streamed webapp logs](screenshots/S13-webapp-logs.PNG "Streamed webapp logs")

Performance validation of the webapp can be performed via a load test using [locust](https://locust.io).
Replace '< yourappname >' in the provided configuration and call locust:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ nano locustfile.py
(.testapp98) azureuser@Azure:~/testapp98$ locust -f locustfile.py --headless -u 20 -r 5 -t 20s
```
Using the parameters above locust will use 20 users with a spawn rate of 5 users per second and run for 20 seconds:
![Load test using locust](screenshots/S14-load-test-locust.PNG "Load test using locust")

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 



## Demo 

[Demo Video](https://www.canva.com/design/DAFytx-w-hQ/SsrjAnK4RIvfCbhqqDObqw/edit?utm_content=DAFytx-w-hQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)


