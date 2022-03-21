// 自动生成模板Fields
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Fields 结构体
// 如果含有time.Time 请自行import time包
type Fields struct {
	global.GVA_MODEL
	DoubleCheck string     `json:"doubleCheck" form:"doubleCheck" gorm:"column:double_check;comment:;size:255;"`
	Max         *int       `json:"max" form:"max" gorm:"column:max;comment:;"`
	Min         *int       `json:"min" form:"min" gorm:"column:min;comment:;"`
	NameAr      string     `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
	NameEn      string     `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
	Regex       string     `json:"regex" form:"regex" gorm:"column:regex;comment:;size:255;"`
	Required    *bool      `json:"required" form:"required" gorm:"column:required;comment:;"`
	TypeId      *int       `json:"typeId" form:"typeId" gorm:"column:type_id;comment:;"`
	Services    []Services `gorm:"many2many:service_field"`
}

// TableName Fields 表名
func (Fields) TableName() string {
	return "fields"
}
