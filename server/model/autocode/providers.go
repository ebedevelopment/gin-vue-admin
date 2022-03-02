// Automatically generate templatesProviders
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Providers structure
//If it contains time.Time, please import the time package by yourself
type Providers struct {
      global.GVA_MODEL
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
}


// TableName Providers Table Name
func (Providers) TableName() string {
  return "providers"
}

