package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type CategoriesService struct {
}

// CreateCategories createCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService) CreateCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Create(&categories).Error
	return err
}

// DeleteCategories DeleteCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)DeleteCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Delete(&categories).Error
	return err
}

// DeleteCategoriesByIds batch deletionCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)DeleteCategoriesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Categories{},"id in ?",ids.Ids).Error
	return err
}

// UpdateCategories updateCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)UpdateCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Save(&categories).Error
	return err
}

// GetCategories Get by idCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)GetCategories(id uint) (err error, categories autocode.Categories) {
	err = global.GVA_DB.Where("id = ?", id).First(&categories).Error
	return
}

// GetCategoriesInfoList Paging acquisitionCategoriesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)GetCategoriesInfoList(info autoCodeReq.CategoriesSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Categories{})
    var categoriess []autocode.Categories
    // If there is a conditional search, the search statement will be automatically created below
    if info.NameAr != "" {
        db = db.Where("name_ar LIKE ?","%"+ info.NameAr+"%")
    }
    if info.NameEn != "" {
        db = db.Where("name_en LIKE ?","%"+ info.NameEn+"%")
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&categoriess).Error
	return err, categoriess, total
}
