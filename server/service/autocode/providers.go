package autocode

import (
	"fmt"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type ProvidersService struct {
}

// CreateProviders createProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) CreateProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Create(&providers).Error
	return err
}

// DeleteProviders DeleteProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) DeleteProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Delete(&providers).Error
	return err
}

// DeleteProvidersByIds batch deletionProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) DeleteProvidersByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Providers{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateProviders updateProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) UpdateProviders(providers autocode.Providers) (err error) {
	err = global.GVA_DB.Save(&providers).Error
	return err
}

// GetProviders Get by idProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) GetProviders(id uint) (err error, providers autocode.Providers) {

	err = global.GVA_DB.Where("id = ?", id).First(&providers).Error

	return
}

// GetProvidersInfoList Paging acquisitionProvidersRecord
// Author [piexlmax](https://github.com/piexlmax)
func (providersService *ProvidersService) GetProvidersInfoList(info autoCodeReq.ProvidersSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// create db
	db := global.GVA_DB.Model(&autocode.Providers{})
	var providerss []autocode.Providers
	// If there is a conditional search, the search statement will be automatically created below
	if info.NameAr != "" {
		db = db.Where("name_ar LIKE ?", "%"+info.NameAr+"%")
	}
	if info.NameEn != "" {
		db = db.Where("name_en LIKE ?", "%"+info.NameEn+"%")
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&providerss).Error
	fmt.Println("providerss", providerss)
	return err, providerss, total
}
