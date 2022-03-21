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

type TerminalsApi struct {
}

var terminalsService = service.ServiceGroupApp.AutoCodeServiceGroup.TerminalsService


// CreateTerminals 创建Terminals
// @Tags Terminals
// @Summary 创建Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminals true "创建Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminals/createTerminals [post]
func (terminalsApi *TerminalsApi) CreateTerminals(c *gin.Context) {
	var terminals autocode.Terminals
	_ = c.ShouldBindJSON(&terminals)
	if err := terminalsService.CreateTerminals(terminals); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteTerminals 删除Terminals
// @Tags Terminals
// @Summary 删除Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminals true "删除Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /terminals/deleteTerminals [delete]
func (terminalsApi *TerminalsApi) DeleteTerminals(c *gin.Context) {
	var terminals autocode.Terminals
	_ = c.ShouldBindJSON(&terminals)
	if err := terminalsService.DeleteTerminals(terminals); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteTerminalsByIds 批量删除Terminals
// @Tags Terminals
// @Summary 批量删除Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /terminals/deleteTerminalsByIds [delete]
func (terminalsApi *TerminalsApi) DeleteTerminalsByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := terminalsService.DeleteTerminalsByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateTerminals 更新Terminals
// @Tags Terminals
// @Summary 更新Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminals true "更新Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /terminals/updateTerminals [put]
func (terminalsApi *TerminalsApi) UpdateTerminals(c *gin.Context) {
	var terminals autocode.Terminals
	_ = c.ShouldBindJSON(&terminals)
	if err := terminalsService.UpdateTerminals(terminals); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindTerminals 用id查询Terminals
// @Tags Terminals
// @Summary 用id查询Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Terminals true "用id查询Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /terminals/findTerminals [get]
func (terminalsApi *TerminalsApi) FindTerminals(c *gin.Context) {
	var terminals autocode.Terminals
	_ = c.ShouldBindQuery(&terminals)
	if err, reterminals := terminalsService.GetTerminals(terminals.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reterminals": reterminals}, c)
	}
}

// GetTerminalsList 分页获取Terminals列表
// @Tags Terminals
// @Summary 分页获取Terminals列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.TerminalsSearch true "分页获取Terminals列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminals/getTerminalsList [get]
func (terminalsApi *TerminalsApi) GetTerminalsList(c *gin.Context) {
	var pageInfo autocodeReq.TerminalsSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := terminalsService.GetTerminalsInfoList(pageInfo); err != nil {
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
