package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
)

type ProvidersApi struct {
}

var providersService = service.ServiceGroupApp.AutoCodeServiceGroup.ProvidersService


// CreateProviders 创建Providers
// @Tags Providers
// @Summary 创建Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "创建Providers"
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

// DeleteProviders 删除Providers
// @Tags Providers
// @Summary 删除Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "删除Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
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

// DeleteProvidersByIds 批量删除Providers
// @Tags Providers
// @Summary 批量删除Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
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

// UpdateProviders 更新Providers
// @Tags Providers
// @Summary 更新Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Providers true "更新Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
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

// FindProviders 用id查询Providers
// @Tags Providers
// @Summary 用id查询Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Providers true "用id查询Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
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

// GetProvidersList 分页获取Providers列表
// @Tags Providers
// @Summary 分页获取Providers列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.ProvidersSearch true "分页获取Providers列表"
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
