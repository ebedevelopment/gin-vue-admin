package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type PackagesService struct {
}

// CreatePackages createPackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService) CreatePackages(packages autocode.Packages) (err error) {
	err = global.GVA_DB.Create(&packages).Error
	return err
}

// DeletePackages DeletePackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService)DeletePackages(packages autocode.Packages) (err error) {
	err = global.GVA_DB.Delete(&packages).Error
	return err
}

// DeletePackagesByIds batch deletionPackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService)DeletePackagesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Packages{},"id in ?",ids.Ids).Error
	return err
}

// UpdatePackages updatePackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService)UpdatePackages(packages autocode.Packages) (err error) {
	err = global.GVA_DB.Save(&packages).Error
	return err
}

// GetPackages Get by idPackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService)GetPackages(id uint) (err error, packages autocode.Packages) {
	err = global.GVA_DB.Where("id = ?", id).First(&packages).Error
	return
}

// GetPackagesInfoList Paging acquisitionPackagesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (packagesService *PackagesService)GetPackagesInfoList(info autoCodeReq.PackagesSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Packages{})
    var packagess []autocode.Packages
    // If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&packagess).Error
	return err, packagess, total
}
