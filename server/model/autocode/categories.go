// Automatically generate templatesCategories
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Categories structure
//If it contains time.Time, please import the time package by yourself
type Categories struct {
      global.GVA_MODEL
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
}


// TableName Categories Table Name
func (Categories) TableName() string {
  return "categories"
}

