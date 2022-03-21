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

type GatewaysApi struct {
}

var gatewaysService = service.ServiceGroupApp.AutoCodeServiceGroup.GatewaysService


// CreateGateways 创建Gateways
// @Tags Gateways
// @Summary 创建Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Gateways true "创建Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /gateways/createGateways [post]
func (gatewaysApi *GatewaysApi) CreateGateways(c *gin.Context) {
	var gateways autocode.Gateways
	_ = c.ShouldBindJSON(&gateways)
	if err := gatewaysService.CreateGateways(gateways); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteGateways 删除Gateways
// @Tags Gateways
// @Summary 删除Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Gateways true "删除Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /gateways/deleteGateways [delete]
func (gatewaysApi *GatewaysApi) DeleteGateways(c *gin.Context) {
	var gateways autocode.Gateways
	_ = c.ShouldBindJSON(&gateways)
	if err := gatewaysService.DeleteGateways(gateways); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteGatewaysByIds 批量删除Gateways
// @Tags Gateways
// @Summary 批量删除Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /gateways/deleteGatewaysByIds [delete]
func (gatewaysApi *GatewaysApi) DeleteGatewaysByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := gatewaysService.DeleteGatewaysByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateGateways 更新Gateways
// @Tags Gateways
// @Summary 更新Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Gateways true "更新Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /gateways/updateGateways [put]
func (gatewaysApi *GatewaysApi) UpdateGateways(c *gin.Context) {
	var gateways autocode.Gateways
	_ = c.ShouldBindJSON(&gateways)
	if err := gatewaysService.UpdateGateways(gateways); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindGateways 用id查询Gateways
// @Tags Gateways
// @Summary 用id查询Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Gateways true "用id查询Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /gateways/findGateways [get]
func (gatewaysApi *GatewaysApi) FindGateways(c *gin.Context) {
	var gateways autocode.Gateways
	_ = c.ShouldBindQuery(&gateways)
	if err, regateways := gatewaysService.GetGateways(gateways.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"regateways": regateways}, c)
	}
}

// GetGatewaysList 分页获取Gateways列表
// @Tags Gateways
// @Summary 分页获取Gateways列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.GatewaysSearch true "分页获取Gateways列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /gateways/getGatewaysList [get]
func (gatewaysApi *GatewaysApi) GetGatewaysList(c *gin.Context) {
	var pageInfo autocodeReq.GatewaysSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := gatewaysService.GetGatewaysInfoList(pageInfo); err != nil {
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
