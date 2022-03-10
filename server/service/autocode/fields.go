package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type FieldsService struct {
}

// CreateFields createFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService) CreateFields(fields autocode.Fields) (err error) {
	err = global.GVA_DB.Create(&fields).Error
	return err
}

// DeleteFields DeleteFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService)DeleteFields(fields autocode.Fields) (err error) {
	err = global.GVA_DB.Delete(&fields).Error
	return err
}

// DeleteFieldsByIds batch deletionFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService)DeleteFieldsByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Fields{},"id in ?",ids.Ids).Error
	return err
}

// UpdateFields updateFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService)UpdateFields(fields autocode.Fields) (err error) {
	err = global.GVA_DB.Save(&fields).Error
	return err
}

// GetFields Get by idFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService)GetFields(id uint) (err error, fields autocode.Fields) {
	err = global.GVA_DB.Where("id = ?", id).First(&fields).Error
	return
}

// GetFieldsInfoList Paging acquisitionFieldsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (fieldsService *FieldsService)GetFieldsInfoList(info autoCodeReq.FieldsSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Fields{})
    var fieldss []autocode.Fields
    // If there is a conditional search, the search statement will be automatically created below
    if info.DoubleCheck != "" {
        db = db.Where("double_check LIKE ?","%"+ info.DoubleCheck+"%")
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&fieldss).Error
	return err, fieldss, total
}
