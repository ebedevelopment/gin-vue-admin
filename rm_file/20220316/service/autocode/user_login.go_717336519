package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type UserLoginService struct {
}

// CreateUserLogin 创建UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService) CreateUserLogin(userLogin autocode.UserLogin) (err error) {
	err = global.GVA_DB.Create(&userLogin).Error
	return err
}

// DeleteUserLogin 删除UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService)DeleteUserLogin(userLogin autocode.UserLogin) (err error) {
	err = global.GVA_DB.Delete(&userLogin).Error
	return err
}

// DeleteUserLoginByIds 批量删除UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService)DeleteUserLoginByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.UserLogin{},"id in ?",ids.Ids).Error
	return err
}

// UpdateUserLogin 更新UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService)UpdateUserLogin(userLogin autocode.UserLogin) (err error) {
	err = global.GVA_DB.Save(&userLogin).Error
	return err
}

// GetUserLogin 根据id获取UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService)GetUserLogin(id uint) (err error, userLogin autocode.UserLogin) {
	err = global.GVA_DB.Where("id = ?", id).First(&userLogin).Error
	return
}

// GetUserLoginInfoList 分页获取UserLogin记录
// Author [piexlmax](https://github.com/piexlmax)
func (userLoginService *UserLoginService)GetUserLoginInfoList(info autoCodeReq.UserLoginSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.UserLogin{})
    var userLogins []autocode.UserLogin
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&userLogins).Error
	return err, userLogins, total
}
