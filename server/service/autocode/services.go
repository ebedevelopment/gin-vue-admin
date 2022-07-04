package autocode

import (
	"encoding/json"
	"fmt"

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
		err := tx.Create(&services).Error
		if err != nil {
			return err
		}
		serviceId := services.GVA_MODEL.ID

		for i, _ := range services.Services {
			services.Services[i].Params.ServiceId = int(serviceId)
		}

		byteValueReq, err := json.Marshal(services.Services)
		fmt.Println(string(byteValueReq))

		if err != nil {
			return err
		}

		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/add"
		fmt.Println(url)
		body, err := global.SendPostReq("POST", byteValueReq, url)
		if err != nil {
			return err
		}
		fmt.Println(string(body))

		return nil
	})
	return err
}

// DeleteServices 删除Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServices(services autocode.Services) error {
	var pkgid []int64
	global.GVA_DB.Raw("SELECT gateways_id FROM service_gateways WHERE services_id = ?", services.ID).Scan(&services.GatewayValues)
	global.GVA_DB.Raw("SELECT fields_id FROM service_fields WHERE services_id = ?", services.ID).Scan(&services.FieldsValues)
	global.GVA_DB.Raw("SELECT id FROM packages WHERE field_id in ?", services.FieldsValues).Scan(&pkgid)
	err := global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		err := global.GVA_DB.Delete(&services).Error
		if err != nil {
			return err
		}
		//Delete service from gateways

		var gatewaysService *GatewaysService
		var ServElemList []autocode.GetServiceElem

		for _, gw := range services.GatewayValues {

			var serv autocode.GetServiceElem
			_, Dns := gatewaysService.GetGateways(uint(gw))
			serv.ServiceId = int(services.ID)
			serv.DNS = Dns.DomainNameService
			serv.PkgIds = pkgid
			ServElemList = append(ServElemList, serv)

		}
		//call wakty for get sevice

		byteValueReq, err := json.Marshal(ServElemList)

		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/delete"
		fmt.Println(url)
		body, err := global.SendPostReq("DELETE", byteValueReq, url)
		fmt.Println(string(body))

		return err
	})

	return err
}

// DeleteServicesByIds 批量删除Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) DeleteServicesByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Services{}, "id in ?", ids.Ids).Error
	return err
	// err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	// 	err := tx.Delete(&[]autocode.Services{}, "id in ?", ids.Ids).Error
	// 	if err != nil {
	// 		return err
	// 	}
	// }

}

// UpdateServices 更新Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) UpdateServices(services autocode.Services) (err error) {
	//	err = global.GVA_DB.Save(&services).Error
	// return err

	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		err := tx.Updates(&services).Error
		if err != nil {
			return err
		}

		byteValueReq, err := json.Marshal(services.Services)
		fmt.Println(string(byteValueReq))

		if err != nil {
			return err
		}

		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/edit"
		fmt.Println(url)
		body, err := global.SendPostReq("PUT", byteValueReq, url)
		if err != nil {
			return err
		}
		fmt.Println(string(body))

		return nil
	})
	return err

}

// GetServices 根据id获取Services记录
// Author [piexlmax](https://github.com/piexlmax)
func (servicesService *ServicesService) GetServices(id uint) (err error, services autocode.Services) {
	// global.GVA_DB.Query()
	var pkgid []int64
	// var servicereq services.Service
	global.GVA_DB.Raw("SELECT gateways_id FROM service_gateways WHERE services_id = ?", id).Scan(&services.GatewayValues)
	global.GVA_DB.Raw("SELECT fields_id FROM service_fields WHERE services_id = ?", id).Scan(&services.FieldsValues)
	global.GVA_DB.Raw("SELECT versions_id FROM service_versions WHERE services_id= ?", id).Scan(&services.VersionValues)
	global.GVA_DB.Raw("SELECT id FROM packages WHERE field_id in ?", services.FieldsValues).Scan(&pkgid)
	var gatewaysService *GatewaysService
	var ServElemList []autocode.GetServiceElem

	for _, gw := range services.GatewayValues {

		var serv autocode.GetServiceElem
		_, Dns := gatewaysService.GetGateways(uint(gw))
		serv.ServiceId = int(id)
		serv.DNS = Dns.DomainNameService
		serv.PkgIds = pkgid
		ServElemList = append(ServElemList, serv)

	}
	//call wakty for get sevice

	byteValueReq, err := json.Marshal(ServElemList)

	url := global.GVA_VP.GetString("gateway-controller.url") + "/service/get"
	fmt.Println(url)
	body, err := global.SendPostReq("POST", byteValueReq, url)

	if err != nil {
		fmt.Print(err)
	}
	fmt.Println(string(body))
	err = json.Unmarshal(body, &services.Services)
	//global.GVA_DB.Raw("SELECT id FROM admin.packages WHERE field_id =?", id).Scan(&services.VersionValues)
	err = global.GVA_DB.Where("id = ?", id).First(&services).Error

	return err, services
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
