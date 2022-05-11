package autocode

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"gorm.io/gorm"
)

type ServicesService struct {
}

// CreateServices 创建Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) CreateServices(services autocode.Services) error {

	// err = global.GVA_DB.Create(&services).Error
	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		err := global.GVA_DB.Create(&services).Error
		if err != nil {
			return err
		}
		err, lastId := servicesService.GetlastServices()
		if err != nil {
			return err
		}
		var ServiceRequestobj autocode.ServiceRequest
		ServiceRequestobj.ServiceId = lastId
		if services.FileUrl != "" {
			jsonFile, err := os.Open(services.FileUrl)
			if err != nil {
				return err
			}
			byteValue, _ := ioutil.ReadAll(jsonFile)

			err = json.Unmarshal(byteValue, &ServiceRequestobj)

			if err != nil {
				fmt.Println("error in marchal", err)
				return err
			}
			byteValueReq, err := json.Marshal(ServiceRequestobj)
			fmt.Println(ServiceRequestobj)

			if err != nil {
				fmt.Println("error:", err)
				return err
			}
			url := global.GVA_VP.GetString("gateway-controller.url") + "/service/add"

			body, err := global.SendPostReq("POST", byteValueReq, url)
			if err != nil {
				return err
			}
			fmt.Println(string(body))
		}
		return nil
	})
	return err
}

// DeleteServices 删除Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServices(services autocode.Services) error {
	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		err := global.GVA_DB.Delete(&services).Error
		if err != nil {
			return err
		}
		//Delete service from gateways
		var IDS request.IdsReq

		IDS.Ids = append(IDS.Ids, int(services.ID))
		byteValueReq, err := json.Marshal(IDS)

		if err != nil {
			fmt.Println("error:", err)
		}
		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/delete"

		_, err = global.SendPostReq("DELETE", byteValueReq, url)
		return err
	})

	return err
}

// DeleteServicesByIds 批量删除Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServicesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Services{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateServices 更新Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) UpdateServices(services autocode.Services) (err error) {
	err = global.GVA_DB.Save(&services).Error
	return err
}

// GetServices 根据id获取Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) GetServices(id uint) (err error, services autocode.Services) {
	err = global.GVA_DB.Where("id = ?", id).First(&services).Error
	return
}

// GetServicesInfoList 分页获取Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) GetServicesInfoList(info autoCodeReq.ServicesSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&autocode.Services{})
	var servicess []autocode.Services
	// 如果有条件搜索 下方会自动创建搜索语句
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
