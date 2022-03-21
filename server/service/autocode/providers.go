package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type ProvidersService struct {
}

// CreateProviders 创建Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) CreateProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Create(&providers).Error
	return err
}

// DeleteProviders 删除Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService)DeleteProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Delete(&providers).Error
	return err
}

// DeleteProvidersByIds 批量删除Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService)DeleteProvidersByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Providers{},"id in ?",ids.Ids).Error
	return err
}

// UpdateProviders 更新Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService)UpdateProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Save(&providers).Error
	return err
}

// GetProviders 根据id获取Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService)GetProviders(id uint) (err error, providers autocode.Providers) {
	err = global.GVA_DB.Where("id = ?", id).First(&providers).Error
	return
}

// GetProvidersInfoList 分页获取Providers记录
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService)GetProvidersInfoList(info autoCodeReq.ProvidersSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.Providers{})
    var providerss []autocode.Providers
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&providerss).Error
	return err, providerss, total
}
