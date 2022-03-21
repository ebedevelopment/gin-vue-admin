package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type MerchantService struct {
}

// CreateMerchant 创建Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService) CreateMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Create(&merchant).Error
	return err
}

// DeleteMerchant 删除Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)DeleteMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Delete(&merchant).Error
	return err
}

// DeleteMerchantByIds 批量删除Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)DeleteMerchantByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Merchant{},"id in ?",ids.Ids).Error
	return err
}

// UpdateMerchant 更新Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)UpdateMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Save(&merchant).Error
	return err
}

// GetMerchant 根据id获取Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)GetMerchant(id uint) (err error, merchant autocode.Merchant) {
	err = global.GVA_DB.Where("id = ?", id).First(&merchant).Error
	return
}

// GetMerchantInfoList 分页获取Merchant记录
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)GetMerchantInfoList(info autoCodeReq.MerchantSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.Merchant{})
    var merchants []autocode.Merchant
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&merchants).Error
	return err, merchants, total
}
