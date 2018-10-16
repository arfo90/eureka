package main

import (
  "fmt"
  "net/http"
  "encoding/json"

  _"github.com/arfo90/eureka/2kagro/lib/models"
  "github.com/aws/aws-lambda-go/events"
  "github.com/aws/aws-lambda-go/lambda"
)

type field struct {
  Id        float64   `json:"id"`
  LocLang   string    `json:"loclang"`
  LocLat    string    `json:"loclat"`
  Moister   float64   `json:"moister"`
  Nitra     float64   `json:"nitra"`
  Ph        float64   `json:"ph"`
}

func create(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

  if req.Headers["Content-Type"] != "application/json" {
    return clientError(http.StatusNotAcceptable)
  }

  fd := new(field)
  err := json.Unmarshal([]byte(req.Body), fd)

  if err != nil {
    //return clientError(http.StatusUnprocessableEntity)
    return showerror(err)
  }

  if fd.Id == 0 {
    return clientError(http.StatusBadRequest)
  }

  return events.APIGatewayProxyResponse{
    StatusCode: 201,
    Body: fmt.Sprintf("Processed request ID %f, following details mois:%f ph:%f nitra:%f", fd.Id, fd.Moister),
  }, nil
}

func clientError(status int) (events.APIGatewayProxyResponse, error) {
  return events.APIGatewayProxyResponse{
    StatusCode: status,
    Body:       http.StatusText(status),
  }, nil
}

func showerror(err error) (events.APIGatewayProxyResponse, error) {
  return events.APIGatewayProxyResponse{
    StatusCode: 400,
    Body:       "error",
  }, err
}

func main(){
  lambda.Start(create)
}
