// 自动生成模板Merchant
package autocode

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Merchant 结构体
// 如果含有time.Time 请自行import time包
type Merchant struct {
      global.GVA_MODEL
      UserId  string `json:"userId" form:"userId" gorm:"column:user_id;comment:;size:45;"`
      Password  string `json:"password" form:"password" gorm:"column:password;comment:;size:255;"`
      Status  *int `json:"status" form:"status" gorm:"column:status;comment:;size:10;"`
      LastLogin  *time.Time `json:"lastLogin" form:"lastLogin" gorm:"column:last_login;comment:;"`
}


// TableName Merchant 表名
func (Merchant) TableName() string {
  return "merchants"
}

