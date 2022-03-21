// 自动生成模板Terminals
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Terminals 结构体
// 如果含有time.Time 请自行import time包
type Terminals struct {
      global.GVA_MODEL
      Sn  string `json:"sn" form:"sn" gorm:"column:sn;comment:;size:255;"`
      Imei  string `json:"imei" form:"imei" gorm:"column:imei;comment:;size:255;"`
      VersionId  *int `json:"versionId" form:"versionId" gorm:"column:version_id;comment:;size:10;"`
      MerchantId  *int `json:"merchantId" form:"merchantId" gorm:"column:merchant_id;comment:;size:10;"`
      Model  string `json:"model" form:"model" gorm:"column:model;comment:;size:255;"`
}


// TableName Terminals 表名
func (Terminals) TableName() string {
  return "terminals"
}

