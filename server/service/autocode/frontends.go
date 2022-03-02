package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type FrontendsService struct {
}

// CreateFrontends createFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService) CreateFrontends(frontends autocode.Frontends) (err error) {
	err = global.GVA_DB.Create(&frontends).Error
	return err
}

// DeleteFrontends DeleteFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService)DeleteFrontends(frontends autocode.Frontends) (err error) {
	err = global.GVA_DB.Delete(&frontends).Error
	return err
}

// DeleteFrontendsByIds batch deletionFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService)DeleteFrontendsByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Frontends{},"id in ?",ids.Ids).Error
	return err
}

// UpdateFrontends updateFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService)UpdateFrontends(frontends autocode.Frontends) (err error) {
	err = global.GVA_DB.Save(&frontends).Error
	return err
}

// GetFrontends Get by idFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService)GetFrontends(id uint) (err error, frontends autocode.Frontends) {
	err = global.GVA_DB.Where("id = ?", id).First(&frontends).Error
	return
}

// GetFrontendsInfoList Paging acquisitionFrontendsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *FrontendsService)GetFrontendsInfoList(info autoCodeReq.FrontendsSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Frontends{})
    var frontendss []autocode.Frontends
    // If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&frontendss).Error
	return err, frontendss, total
}
