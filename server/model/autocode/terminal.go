// Automatically generate templatesTerminal
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Terminal structure
//If it contains time.Time, please import the time package by yourself
type Terminal struct {
      global.GVA_MODEL
      AppId  *int `json:"appId" form:"appId" gorm:"column:app_id;comment:;size:10;"`
      Imei  string `json:"imei" form:"imei" gorm:"column:imei;comment:;size:255;"`
      Sn  string `json:"sn" form:"sn" gorm:"column:sn;comment:;size:255;"`
      UserId  *int `json:"userId" form:"userId" gorm:"column:user_id;comment:;size:10;"`
}


// TableName Terminal Table Name
func (Terminal) TableName() string {
  return "terminal"
}

