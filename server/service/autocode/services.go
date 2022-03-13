package autocode

import (
	"fmt"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type ServicesService struct {
}

// CreateServices createServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) CreateServices(services autocode.Services) (err error) {
	err = global.GVA_DB.Create(&services).Error
	return err
}

// DeleteServices DeleteServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServices(services autocode.Services) (err error) {

	err = global.GVA_DB.Delete(&services).Error
	fmt.Println("Err: ", err)
	return err
}

// DeleteServicesByIds batch deletionServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServicesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Services{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateServices updateServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) UpdateServices(services autocode.Services) (err error) {
	err = global.GVA_DB.Save(&services).Error
	return err
}

// GetServices Get by idServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) GetServices(id uint) (err error, services autocode.Services) {
	err = global.GVA_DB.Where("id = ?", id).First(&services).Error
	return
}

// GetServicesInfoList Paging acquisitionServicesRecord
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) GetServicesInfoList(info autoCodeReq.ServicesSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// create db
	db := global.GVA_DB.Model(&autocode.Services{})
	var servicess []autocode.Services
	// If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&servicess).Error
	return err, servicess, total
}
func (servicesService *ServicesService) GetlastServices() (err error, serviceid uint) {
	var lastService autocode.Services
	err = global.GVA_DB.Last(&lastService).Error
	return err, lastService.ID
}
