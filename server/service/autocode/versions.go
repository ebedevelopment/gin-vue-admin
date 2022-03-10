package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type VersionsService struct {
}

// CreateVersions createVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService) CreateVersions(versions autocode.Versions) (err error) {
	err = global.GVA_DB.Create(&versions).Error
	return err
}

// DeleteVersions DeleteVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService)DeleteVersions(versions autocode.Versions) (err error) {
	err = global.GVA_DB.Delete(&versions).Error
	return err
}

// DeleteVersionsByIds batch deletionVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService)DeleteVersionsByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Versions{},"id in ?",ids.Ids).Error
	return err
}

// UpdateVersions updateVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService)UpdateVersions(versions autocode.Versions) (err error) {
	err = global.GVA_DB.Save(&versions).Error
	return err
}

// GetVersions Get by idVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService)GetVersions(id uint) (err error, versions autocode.Versions) {
	err = global.GVA_DB.Where("id = ?", id).First(&versions).Error
	return
}

// GetVersionsInfoList Paging acquisitionVersionsRecord
// Author [piexlmax](https://github.com/piexlmax)
func (versionsService *VersionsService)GetVersionsInfoList(info autoCodeReq.VersionsSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Versions{})
    var versionss []autocode.Versions
    // If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&versionss).Error
	return err, versionss, total
}
