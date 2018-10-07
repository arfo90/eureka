package main

import (
  "fmt"
  "net/http"
  "encoding/json"

  "github.com/arfo90/eureka/2kagro/lib/models"
  "github.com/aws/aws-lambda-go/events"
  "github.com/aws/aws-lambda-go/lambda"
)

func create(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
  if req.Headers["Content-Type"] != "application/json" {
    return clientError(http.StatusNotAcceptable)
  }

  fd := new(models.Field)
  err := json.Unmarshal([]byte(req.Body), fd)

  if err != nil {
    return clientError(http.StatusUnprocessableEntity)
  }

  if fd.Id == 0 {
    return clientError(http.StatusBadRequest)
  }


  return events.APIGatewayProxyResponse{
    StatusCode: 201,
    Body: fmt.Sprintf("Processed request ID %f, following details mois:%f ph:%f nitra:%f",  fd.Id, fd.Moister, fd.Nitra, fd.Ph),
  }, nil
}

func clientError(status int) (events.APIGatewayProxyResponse, error) {
  return events.APIGatewayProxyResponse{
    StatusCode: status,
    Body:       http.StatusText(status),
  }, nil
}

func main(){
  lambda.Start(create)
}
