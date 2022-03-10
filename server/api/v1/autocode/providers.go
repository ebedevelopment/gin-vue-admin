package autocode

import (
	

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type ProvidersApi struct {
}

var providersService = service.ServiceGroupApp.AutoCodeServiceGroup.ProvidersService


// CreateProviders CreateProviders
// @Tags Providers
// @Summary CreateProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "CreateProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /providers/createProviders [post]
func (providersApi *ProvidersApi) CreateProviders(c *gin.Context) {
	var providers autocode.Providers
	_ = c.ShouldBindJSON(&providers)
	if err := providersService.CreateProviders(providers); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteProviders DeleteProviders
// @Tags Providers
// @Summary DeleteProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "DeleteProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /providers/deleteProviders [delete]
func (providersApi *ProvidersApi) DeleteProviders(c *gin.Context) {
	var providers autocode.Providers
	_ = c.ShouldBindJSON(&providers)
	if err := providersService.DeleteProviders(providers); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteProvidersByIds batch deletionProviders
// @Tags Providers
// @Summary batch deletionProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /providers/deleteProvidersByIds [delete]
func (providersApi *ProvidersApi) DeleteProvidersByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := providersService.DeleteProvidersByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateProviders UpdateProviders
// @Tags Providers
// @Summary UpdateProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "UpdateProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /providers/updateProviders [put]
func (providersApi *ProvidersApi) UpdateProviders(c *gin.Context) {
	var providers autocode.Providers
	_ = c.ShouldBindJSON(&providers)
	if err := providersService.UpdateProviders(providers); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindProviders query by idProviders
// @Tags Providers
// @Summary query by idProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Providers true "query by idProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /providers/findProviders [get]
func (providersApi *ProvidersApi) FindProviders(c *gin.Context) {
	var providers autocode.Providers
	_ = c.ShouldBindQuery(&providers)
	if err, reproviders := providersService.GetProviders(providers.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reproviders": reproviders}, c)
	}
}

// GetProvidersList Paging acquisitionProvidersList
// @Tags Providers
// @Summary Paging acquisitionProviders List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.ProvidersSearch true "PagingProviderslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /providers/getProvidersList [get]
func (providersApi *ProvidersApi) GetProvidersList(c *gin.Context) {
	var pageInfo autocodeReq.ProvidersSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := providersService.GetProvidersInfoList(pageInfo); err != nil {
	    global.GVA_LOG.Error(global.Translate("general.getDataFail"), zap.Error(err))
        response.FailWithMessage(global.Translate("general.getDataFailErr"), c)
    } else {
        response.OkWithDetailed(response.PageResult{
            List:     list,
            Total:    total,
            Page:     pageInfo.Page,
            PageSize: pageInfo.PageSize,
        }, global.Translate("general.getDataSuccess"), c)
    }

}
