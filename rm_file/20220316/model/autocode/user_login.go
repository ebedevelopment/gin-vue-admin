// 自动生成模板UserLogin
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// UserLogin 结构体
// 如果含有time.Time 请自行import time包
type UserLogin struct {
      global.GVA_MODEL
      UserId  string `json:"userId" form:"userId" gorm:"column:user_id;comment:;size:45;"`
      Password  string `json:"password" form:"password" gorm:"column:password;comment:;size:255;"`
      Status  *int `json:"status" form:"status" gorm:"column:status;comment:;size:10;"`
      LastLogin  *time.Time `json:"lastLogin" form:"lastLogin" gorm:"column:last_login;comment:;"`
}


// TableName UserLogin 表名
func (UserLogin) TableName() string {
  return "user_login"
}
