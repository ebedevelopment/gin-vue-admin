// Automatically generate templatesMerchant
package autocode

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Merchant structure
//If it contains time.Time, please import the time package by yourself
type Merchant struct {
      global.GVA_MODEL
      CreateBy  *int `json:"createBy" form:"createBy" gorm:"column:create_by;comment:;size:10;"`
      LastLogin  *time.Time `json:"lastLogin" form:"lastLogin" gorm:"column:last_login;comment:;"`
      Password  string `json:"password" form:"password" gorm:"column:password;comment:;size:255;"`
      Status  *int `json:"status" form:"status" gorm:"column:status;comment:;size:10;"`
      UpdateBy  *int `json:"updateBy" form:"updateBy" gorm:"column:update_by;comment:;size:10;"`
      UserName  string `json:"userName" form:"userName" gorm:"column:user_name;comment:;size:255;"`
}


// TableName Merchant Table Name
func (Merchant) TableName() string {
  return "merchant"
}

