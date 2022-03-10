// Automatically generate templatesVersions
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Versions structure
//If it contains time.Time, please import the time package by yourself
type Versions struct {
      global.GVA_MODEL
      ServiceListVersion  string `json:"serviceListVersion" form:"serviceListVersion" gorm:"column:service_list_version;comment:;size:255;"`
      SoftwareVersion  string `json:"softwareVersion" form:"softwareVersion" gorm:"column:software_version;comment:;size:255;"`
}


// TableName Versions Table Name
func (Versions) TableName() string {
  return "versions"
}

