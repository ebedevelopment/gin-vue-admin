// 自动生成模板Providers
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Providers 结构体
// 如果含有time.Time 请自行import time包
type Providers struct {
      global.GVA_MODEL
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
}


// TableName Providers 表名
func (Providers) TableName() string {
  return "providers"
}

