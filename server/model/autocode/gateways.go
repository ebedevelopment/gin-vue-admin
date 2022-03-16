// 自动生成模板Gateways
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Gateways 结构体
// 如果含有time.Time 请自行import time包
type Gateways struct {
	global.GVA_MODEL
	DomainNameService string     `json:"domainNameService" form:"domainNameService" gorm:"column:domain_name_service;comment:;size:255;"`
	NameAr            string     `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
	NameEn            string     `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
	Services          []Services `gorm:"many2many:service_gateways"`
}

// TableName Gateways 表名
func (Gateways) TableName() string {
	return "gateways"
}
