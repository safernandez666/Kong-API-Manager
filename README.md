# API Manager Stack 

Run Kong Server + Konga + Prometheus + API & DDBB + Splunk

Clone the proyect and run docker-compose up

```bash
git clone https://github.com/safernandez666/SOCLess.git && cd SOCLess
chmod +x kong-start.sh
sh kong-start.sh
```
# Running the stack

<p align="center">
<img src="screenshots/kongscript.png" width="800" >
</p>

# Containers

Check the name of the containers for future configurations.

<p align="center">
<img src="screenshots/dockerps.png" width="800" >
</p>

# Architecture

<p align="center">
<img src="screenshots/Architecture.png" width="800" >
</p>

### Create Service on Kong

curl -i -X POST \
--url http://localhost:8001/services/ \
--data 'name=MyAPI' \
--data 'url=http://api:5000'

Test

curl -i http://localhost:8001/services/MyAPI

### Create Route on the Service

curl -i -X POST http://localhost:8001/services/MyAPI/routes \
  --data 'paths[]=/' \
  --data name=main

Test

curl -i -X GET http://localhost:8000/request

### Konga GUI 

Enter on [http://localhost:1337](http://localhost:1337) 

I create the Username and Password on kus.js. It's important change the Password.

Create the connection

<p align="center">
<img src="screenshots/Kong_Config.png" width="800" >
</p>


<p align="center">
<img src="screenshots/Kong_1.png" width="800" >
</p>

Add plug-in and send logs to Splunk

<p align="center">
<img src="screenshots/Kong_2.png" width="800" >
</p>

<p align="center">
<img src="screenshots/Kong_3.png" width="800" >
</p>

### Splunk 

Enter on [http://localhost:8888](http://localhost:8888) with Username: admin and Password: password

Create the Data Input on port 1514 to receive the Kong's logs.

I create a panel, to visualize some data. You can create yours.

<p align="center">
<img src="screenshots/SplunkDashboard.png" width="800" >
</p>

### Prometheus + Grafana

Prometheus to store the data and Grafana to visualize it.

Add the plugin.

<p align="center">
<img src="screenshots/Plugin.png" width="600" >
</p>

Ingress on Grafana on [http://localhost:3000](http://localhost:3000) with Username: admin and Password: admin

Import data from prometheus. The docker is prometheus on port 9090.

<p align="center">
<img src="screenshots/Prometheus_1.png" width="600" >
</p>

Import the Dashboard.

<p align="center">
<img src="screenshots/Prometheus_2.png" width="600" >
</p>

Load the JSON.

<p align="center">
<img src="screenshots/Prometheus_3.png" width="300" >
</p>

Enjoy the metrics.

<p align="center">
<img src="screenshots/PrometheusDashboard.png" width="800" >
</p>