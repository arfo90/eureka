Depot for weather data which is sent from things(sensors)

POC of implimenting IoT system based on cloud computing design and implimentation practices and patterns


Ideas
-----

1- loging temp data as time series data
2- create depot
3- API access to depot, -> should be Rest??

Features
--------
30/3/15: Create simple and dummy rest api which can respond 

30/3/15: design and build poc for database that it needed 

30/3/15: verify all tech and design

30/3/15: registering data into the database using API

30/3/15: intigrate RasperyPI with it


Start
-----

 To send jason post request 
     curl -H "Content-Type: application/json" -X POST -d '{"date":"Am I nailed it?"}' http://localhost:80/save

Docerized
--------
  All Rake tasks now is dockerized so upon test task for example, test happens in container
