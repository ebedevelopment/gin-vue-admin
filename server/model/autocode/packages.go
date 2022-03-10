// Automatically generate templatesPackages
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Packages structure
//If it contains time.Time, please import the time package by yourself
type Packages struct {
      global.GVA_MODEL
      FieldId  *int `json:"fieldId" form:"fieldId" gorm:"column:field_id;comment:;size:10;"`
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
      PkgCode  string `json:"pkgCode" form:"pkgCode" gorm:"column:pkg_code;comment:;size:255;"`
}


// TableName Packages Table Name
func (Packages) TableName() string {
  return "packages"
}

