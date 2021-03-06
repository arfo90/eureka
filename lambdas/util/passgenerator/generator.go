package passgenerator

import "math/rand"
import "time"

const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const numbers = "0123456789"
const specials = "%@#$^&!()><?"

func Generate(longPassword bool) string{
  bluePrint := buildBluePrint(longPassword)
  return fillUpBluePrint(bluePrint)
}

func buildBluePrint(longPassword bool) []byte {
  var bluePrint []byte
  if (longPassword){
    bluePrint = []byte{'N','N','N','N','S','S','S','L','L','L','L','L','L','L'}
  } else {
    bluePrint = []byte{'N','N','S','S','L','L','L','L'}
  }
  bluePrint = shuffle(bluePrint)
  return bluePrint
}


func fillUpBluePrint(bluePrint []byte) string{
  password := ""
  rand.Seed(time.Now().UnixNano())
  for _, slot := range bluePrint {
    switch s := slot; s {
    case 'N':
      password = password + string(numbers[rand.Intn(len(numbers))])
    case 'L':
      password = password + string(letters[rand.Intn(len(letters))])
    case 'S':
      password = password + string(specials[rand.Intn(len(numbers))])
    default:
      password = ""
    }
  }
  return password
}

func shuffle(bluePrint []byte) []byte{
  r := rand.New(rand.NewSource(time.Now().Unix()))
  var newBluePrint []byte
  for _, slot := range r.Perm(len(bluePrint)) {
    val := bluePrint[slot]
    newBluePrint = append(newBluePrint, val)
  }
  return newBluePrint
}
