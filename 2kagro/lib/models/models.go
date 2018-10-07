package models

type Field struct {
  Id        float64  `json:"id"`
  LocLang   string   `json:"loclang"`
  LocLat    string   `json:"loclat"`
  Moister   float64  `json:"moister"`
  Nitra     float64  `json:"nitra"`
  Ph        float64  `json:"ph"`
}
