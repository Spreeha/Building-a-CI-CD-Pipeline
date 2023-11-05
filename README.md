[![Python application test with Github Actions](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/actions/workflows/main.yml)

# Overview
This project demoes building CI/CD pipelines with .
A Machine Learning web application is built, test, and deployed using Github Actions and Azure pipelines.

[Demo Video](https://youtu.be/Wl0BEl4KI9k)

## Project Plan


Trello board - 
The [yearly project plan](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/blob/main/projectplan/project%20plan%202023.xlsx) shows how important automation is in the project plan.

The [quarterly project plan](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/blob/main/projectplan/project%20plan%20Q2.xlsx) shows the steps for building the CI-CD pipeline and other estimate details

The [Trello board](https://trello.com/invite/b/kSTHkrAB/ATTId5d4bb3bc2c703a5e22446ac9c7819129517387B/agile-board-template-trello) is then used for task planning and tracking.

## Instructions

  
![Architecture](architecture/Architecture.png "Architecture")

* Project running on Azure App Service
Install the app to Azure app services using the free tier:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ az webapp up -n flask-sklearn --sku F1
```
![webapp_deployed_on_azure](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/b09ad2a8-b810-407c-8dfa-88bbffb080c5)


![webapp_on_azure_portal](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/cec586c4-0444-4a5e-ade5-867eea3f3295)


Edit file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. testapp98).

Test the webapp locally or on Azure Cloud Shell:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ ./make_predict_azure_app.sh
```
![ml_prediction_response](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/49b70ea5-ce3b-44ee-a843-f2b0b2438854)


Logs of your running webapp can be accessed via cloud shell as a stream:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ az webapp log tail
```
![Logs](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/cb113e88-2519-46bc-8385-c76564d37762)


Performance validation of the webapp can be performed via a load test using [locust](https://locust.io).
Replace '< yourappname >' in the provided configuration and call locust:
```bash
(.testapp98) azureuser@Azure:~/testapp98$ nano locustfile.py
(.testapp98) azureuser@Azure:~/testapp98$ locust -f locustfile.py --headless -u 20 -r 5 -t 20s
```
![image](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/2008295e-ac38-4e35-a2e1-8390a3f60c1f)


* Passing tests that are displayed after running the `make all` command from the `Makefile`
  ![image](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/8a1e4daf-e4f3-4279-8fd5-c0cce6cc5f71)


* Output of a test run
  ![ml_prediction_response](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/8723121a-d7ee-4a96-81df-7c1fd881c29b)


* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

![azure_pipeline](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/26c0957d-5761-4033-b5b4-14f6ac65fd23)


* Running Azure App Service from Azure Pipelines automatic deployment

![webapp_on_azure_portal](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/5fd79dc6-871a-4355-9535-438c5f85e5d0)

* GitHub Actions build
  ![working_github_actions_build](https://github.com/Spreeha/Building-a-CI-CD-Pipeline/assets/36483814/837f9791-de24-4a79-9eaa-16176f0cee84)


>

## Demo 

[Demo Video](https://youtu.be/Wl0BEl4KI9k)


