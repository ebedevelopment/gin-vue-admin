// 自动生成模板Packages
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Packages 结构体
// 如果含有time.Time 请自行import time包
type Packages struct {
      global.GVA_MODEL
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
      PckgCode  string `json:"pckgCode" form:"pckgCode" gorm:"column:pckg_code;comment:;size:255;"`
      FieldId  *int `json:"fieldId" form:"fieldId" gorm:"column:field_id;comment:;size:19;"`
}


// TableName Packages 表名
func (Packages) TableName() string {
  return "packages"
}

