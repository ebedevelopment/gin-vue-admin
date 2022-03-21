package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type VersionsService struct {
}

// CreateVersions 创建Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService) CreateVersions(frontends autocode.Versions) (err error) {
	err = global.GVA_DB.Create(&frontends).Error
	return err
}

// DeleteVersions 删除Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService)DeleteVersions(frontends autocode.Versions) (err error) {
	err = global.GVA_DB.Delete(&frontends).Error
	return err
}

// DeleteVersionsByIds 批量删除Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService)DeleteVersionsByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Versions{},"id in ?",ids.Ids).Error
	return err
}

// UpdateVersions 更新Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService)UpdateVersions(frontends autocode.Versions) (err error) {
	err = global.GVA_DB.Save(&frontends).Error
	return err
}

// GetVersions 根据id获取Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService)GetVersions(id uint) (err error, frontends autocode.Versions) {
	err = global.GVA_DB.Where("id = ?", id).First(&frontends).Error
	return
}

// GetVersionsInfoList 分页获取Versions记录
// Author [piexlmax](https://github.com/piexlmax)
func (frontendsService *VersionsService)GetVersionsInfoList(info autoCodeReq.VersionsSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.Versions{})
    var frontendss []autocode.Versions
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&frontendss).Error
	return err, frontendss, total
}
