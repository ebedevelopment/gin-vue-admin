package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type MerchantService struct {
}

// CreateMerchant createMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService) CreateMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Create(&merchant).Error
	return err
}

// DeleteMerchant DeleteMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)DeleteMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Delete(&merchant).Error
	return err
}

// DeleteMerchantByIds batch deletionMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)DeleteMerchantByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Merchant{},"id in ?",ids.Ids).Error
	return err
}

// UpdateMerchant updateMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)UpdateMerchant(merchant autocode.Merchant) (err error) {
	err = global.GVA_DB.Save(&merchant).Error
	return err
}

// GetMerchant Get by idMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)GetMerchant(id uint) (err error, merchant autocode.Merchant) {
	err = global.GVA_DB.Where("id = ?", id).First(&merchant).Error
	return
}

// GetMerchantInfoList Paging acquisitionMerchantRecord
// Author [piexlmax](https://github.com/piexlmax)
func (merchantService *MerchantService)GetMerchantInfoList(info autoCodeReq.MerchantSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Merchant{})
    var merchants []autocode.Merchant
    // If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&merchants).Error
	return err, merchants, total
}
