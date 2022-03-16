package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type CategoriesService struct {
}

// CreateCategories 创建Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService) CreateCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Create(&categories).Error
	return err
}

// DeleteCategories 删除Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)DeleteCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Delete(&categories).Error
	return err
}

// DeleteCategoriesByIds 批量删除Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)DeleteCategoriesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Categories{},"id in ?",ids.Ids).Error
	return err
}

// UpdateCategories 更新Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)UpdateCategories(categories autocode.Categories) (err error) {
	err = global.GVA_DB.Save(&categories).Error
	return err
}

// GetCategories 根据id获取Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)GetCategories(id uint) (err error, categories autocode.Categories) {
	err = global.GVA_DB.Where("id = ?", id).First(&categories).Error
	return
}

// GetCategoriesInfoList 分页获取Categories记录
// Author [piexlmax](https://github.com/piexlmax)
func (categoriesService *CategoriesService)GetCategoriesInfoList(info autoCodeReq.CategoriesSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.Categories{})
    var categoriess []autocode.Categories
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&categoriess).Error
	return err, categoriess, total
}
