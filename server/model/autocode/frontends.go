// Automatically generate templatesFrontends
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Frontends structure
//If it contains time.Time, please import the time package by yourself
type Frontends struct {
      global.GVA_MODEL
      Name  string `json:"name" form:"name" gorm:"column:name;comment:;size:255;"`
      ServiceListVersion  string `json:"serviceListVersion" form:"serviceListVersion" gorm:"column:service_list_version;comment:;size:255;"`
      SoftwareVersion  string `json:"softwareVersion" form:"softwareVersion" gorm:"column:software_version;comment:;size:255;"`
      Services []Services `gorm:"many2many:service_frontend"`
  }


// TableName Frontends Table Name
func (Frontends) TableName() string {
  return "frontends"
}

