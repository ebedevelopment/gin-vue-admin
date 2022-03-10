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

// CreateServices CreateServices
// @Tags Services
// @Summary CreateServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "CreateServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/createServices [post]
func (servicesApi *ServicesApi) CreateServices(c *gin.Context) {
	var services autocode.Services
	_ = c.ShouldBindJSON(&services)
	var ServiceRequestobj autocode.ServiceRequest

	for _, id := range services.GatewayValues {
		_, regateways := gatewaysService.GetGateways(uint(id))
		services.Gateways = append(services.Gateways, regateways)
	}

	for _, id := range services.FieldsValues {
		_, refield := fieldsService.GetFields(uint(id))
		services.Fields = append(services.Fields, refield)
	}

	if err := servicesService.CreateServices(services); err != nil {
		global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {

		_, id := servicesService.GetlastServices()
		ServiceRequestobj.ServiceId = id

		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}

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
	url := "https://127.0.0.1:8087/api/v1/service/add"

	body := global.SendPostReq(byteValueReq, url)
	fmt.Println(string(body))


}

// DeleteServices DeleteServices
// @Tags Services
// @Summary DeleteServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "DeleteServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /services/deleteServices [delete]
func (servicesApi *ServicesApi) DeleteServices(c *gin.Context) {
	var services autocode.Services
	_ = c.ShouldBindJSON(&services)
	if err := servicesService.DeleteServices(services); err != nil {
		global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteServicesByIds batch deletionServices
// @Tags Services
// @Summary batch deletionServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
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

// UpdateServices UpdateServices
// @Tags Services
// @Summary UpdateServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Services true "UpdateServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
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
}

// FindServices query by idServices
// @Tags Services
// @Summary query by idServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Services true "query by idServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
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

// GetServicesList Paging acquisitionServicesList
// @Tags Services
// @Summary Paging acquisitionServices List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.ServicesSearch true "PagingServiceslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/getServicesList [get]
func (servicesApi *ServicesApi) GetServicesList(c *gin.Context) {
	var pageInfo autocodeReq.ServicesSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := servicesService.GetServicesInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error(global.Translate("general.getDataFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.getDataFailErr"), c)
	} else {

		//service list appear category name value not category id

		var service autocode.ServiceList
		var services []autocode.ServiceList
		servicelist, ok := list.([]autocode.Services)
		for _, s := range servicelist {
			_, category := categoriesService.GetCategories(uint(*s.CategoryId))
			service.CategoryId = category.NameEn
			service.Count = s.Count
			service.CreatedAt = s.CreatedAt
			service.DefaultGateway = s.DefaultGateway
			service.ID = s.ID
			service.Inquirable = s.Inquirable
			service.IsPar = s.IsPar
			service.IsPrice = s.IsPrice
			service.NameAr = s.NameAr
			service.NameEn = s.NameEn
			service.Price = s.Price
			_, provider := providersService.GetProviders(uint(*s.ProviderId))
			service.ProviderId = provider.NameEn

			//TODO gateways , fields, frontends specifies with service

			services = append(services, service)
		}
		fmt.Println("service list ", services, "ok : ", ok)

		response.OkWithDetailed(response.PageResult{
			List:     services,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, global.Translate("general.getDataSuccess"), c)
	}
}
