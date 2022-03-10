// Automatically generate templatesGateways
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Gateways structure
//If it contains time.Time, please import the time package by yourself
type Gateways struct {
      global.GVA_MODEL
      DomainNameService  string `json:"domainNameService" form:"domainNameService" gorm:"column:domain_name_service;comment:;size:255;"`
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
      Services []Services `gorm:"many2many:service_gateway"`
}


// TableName Gateways Table Name
func (Gateways) TableName() string {
  return "gateways"
}

