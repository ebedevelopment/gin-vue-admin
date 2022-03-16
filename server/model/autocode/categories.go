// 自动生成模板Categories
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Categories 结构体
// 如果含有time.Time 请自行import time包
type Categories struct {
      global.GVA_MODEL
      NameAr  string `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
      NameEn  string `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
      
}


// TableName Categories 表名
func (Categories) TableName() string {
  return "categories"
}

