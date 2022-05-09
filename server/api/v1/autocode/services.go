package autocode

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type ServicesApi struct {
}

var servicesService = service.ServiceGroupApp.AutoCodeServiceGroup.ServicesService

// CreateServices 创建Services
// @Tags Services
// @Summary 创建Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "创建Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/createServices [post]
func (servicesApi *ServicesApi) CreateServices(c *gin.Context) {
	var services autocode.Services
	var ServiceRequestobj autocode.ServiceRequest
	_ = c.ShouldBindJSON(&services)

	for _, id := range services.GatewayValues {
		_, regateways := gatewaysService.GetGateways(uint(id))
		services.Gateways = append(services.Gateways, regateways)
	}

	for _, id := range services.FieldsValues {
		_, refield := fieldsService.GetFields(uint(id))
		services.Fields = append(services.Fields, refield)
	}
	for _, id := range services.VersionValues {
		_, reversion := frontendsService.GetVersions(uint(id))
		services.Versions = append(services.Versions, reversion)
	}

	if err := servicesService.CreateServices(services); err != nil {
		global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {

		_, id := servicesService.GetlastServices()
		ServiceRequestobj.ServiceId = id

		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
	if services.FileUrl != "" {

		jsonFile, err := os.Open(services.FileUrl)
		byteValue, _ := ioutil.ReadAll(jsonFile)

		err = json.Unmarshal(byteValue, &ServiceRequestobj)
		if err != nil {
			fmt.Println("error in marchal", err)
		}
		byteValueReq, err := json.Marshal(ServiceRequestobj)
		fmt.Println(ServiceRequestobj)

		if err != nil {
			fmt.Println("error:", err)
		}
		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/add"

		body := global.SendPostReq("POST", byteValueReq, url)
		fmt.Println(string(body))
	}
}

// DeleteServices 删除Services
// @Tags Services
// @Summary 删除Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "删除Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /services/deleteServices [delete]
func (servicesApi *ServicesApi) DeleteServices(c *gin.Context) {
	var services autocode.Services
	_ = c.ShouldBindJSON(&services)
	//Delete service from gateways
	var IDS request.IdsReq

	IDS.Ids = append(IDS.Ids, int(services.ID))
	byteValueReq, err := json.Marshal(IDS)

	if err != nil {
		fmt.Println("error:", err)
	}
	url := global.GVA_VP.GetString("gateway-controller.url") + "/service/delete"

	global.SendPostReq("DELETE", byteValueReq, url)
	if err := servicesService.DeleteServices(services); err != nil {
		global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}

}

// DeleteServicesByIds 批量删除Services
// @Tags Services
// @Summary 批量删除Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /services/deleteServicesByIds [delete]
func (servicesApi *ServicesApi) DeleteServicesByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := servicesService.DeleteServicesByIds(IDS); err != nil {
		global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateServices 更新Services
// @Tags Services
// @Summary 更新Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "更新Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /services/updateServices [put]
func (servicesApi *ServicesApi) UpdateServices(c *gin.Context) {
	var services autocode.Services
	_ = c.ShouldBindJSON(&services)
	if err := servicesService.UpdateServices(services); err != nil {
		global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
	var ServiceRequestobj autocode.ServiceRequest
	ServiceRequestobj.ServiceId = services.ID
	if services.FileUrl != "" {

		jsonFile, err := os.Open(services.FileUrl)
		byteValue, _ := ioutil.ReadAll(jsonFile)

		err = json.Unmarshal(byteValue, &ServiceRequestobj)
		if err != nil {
			fmt.Println("error in marchal", err)
		}
		byteValueReq, err := json.Marshal(ServiceRequestobj)

		if err != nil {
			fmt.Println("error:", err)
		}
		url := global.GVA_VP.GetString("gateway-controller.url") + "/service/update"

		global.SendPostReq("PUT", byteValueReq, url)
	}
}

// FindServices 用id查询Services
// @Tags Services
// @Summary 用id查询Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Services true "用id查询Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /services/findServices [get]
func (servicesApi *ServicesApi) FindServices(c *gin.Context) {
	var services autocode.Services
	_ = c.ShouldBindQuery(&services)
	if err, reservices := servicesService.GetServices(services.ID); err != nil {
		global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reservices": reservices}, c)
	}
}

// GetServicesList 分页获取Services列表
// @Tags Services
// @Summary 分页获取Services列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.ServicesSearch true "分页获取Services列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/getServicesList [get]
func (servicesApi *ServicesApi) GetServicesList(c *gin.Context) {
	var pageInfo autocodeReq.ServicesSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := servicesService.GetServicesInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error(global.Translate("general.getDataFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.getDataFailErr"), c)
	} else {

		var service autocode.ServiceList
		var services []autocode.ServiceList
		servicelist, ok := list.([]autocode.Services)
		for _, s := range servicelist {

			_, category := categoriesService.GetCategories(uint(*s.CatId))
			_, gateway := gatewaysService.GetGateways(uint(*s.DefaultGatewayDn))
			service.CategoryId = category.NameEn
			service.Count = s.Count
			service.CreatedAt = s.CreatedAt

			service.DefaultGateway = gateway.DomainNameService
			service.ID = s.ID
			service.Inquirable = s.Inq

			service.IsPar = s.IsPar
			service.IsPrice = s.IsPrice
			service.NameAr = s.NameAr

			service.NameEn = s.NameEn
			service.Price = s.Price
			_, provider := providersService.GetProviders(uint(*s.ProvId))
			service.ProviderId = provider.NameEn

			//TODO gateways , fields, frontends specifies with service

			services = append(services, service)
		}
		fmt.Println("service list ", services, "ok : ", ok)

		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, global.Translate("general.getDataSuccess"), c)
	}
}
