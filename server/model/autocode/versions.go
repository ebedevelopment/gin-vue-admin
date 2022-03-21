// 自动生成模板Versions
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Versions 结构体
// 如果含有time.Time 请自行import time包
type Versions struct {
	global.GVA_MODEL
	ServiceListVersion string     `json:"serviceListVersion" form:"serviceListVersion" gorm:"column:service_list_version;comment:;size:255;"`
	SoftwareVersion    string     `json:"softwareVersion" form:"softwareVersion" gorm:"column:software_version;comment:;size:255;"`
	Services           []Services `gorm:"many2many:service_versions"`
}

// TableName Versions 表名
func (Versions) TableName() string {
	return "versions"
}
