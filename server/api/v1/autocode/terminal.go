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

type TerminalApi struct {
}

var terminalService = service.ServiceGroupApp.AutoCodeServiceGroup.TerminalService


// CreateTerminal CreateTerminal
// @Tags Terminal
// @Summary CreateTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminal true "CreateTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminal/createTerminal [post]
func (terminalApi *TerminalApi) CreateTerminal(c *gin.Context) {
	var terminal autocode.Terminal
	_ = c.ShouldBindJSON(&terminal)
	if err := terminalService.CreateTerminal(terminal); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteTerminal DeleteTerminal
// @Tags Terminal
// @Summary DeleteTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminal true "DeleteTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /terminal/deleteTerminal [delete]
func (terminalApi *TerminalApi) DeleteTerminal(c *gin.Context) {
	var terminal autocode.Terminal
	_ = c.ShouldBindJSON(&terminal)
	if err := terminalService.DeleteTerminal(terminal); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteTerminalByIds batch deletionTerminal
// @Tags Terminal
// @Summary batch deletionTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /terminal/deleteTerminalByIds [delete]
func (terminalApi *TerminalApi) DeleteTerminalByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := terminalService.DeleteTerminalByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateTerminal UpdateTerminal
// @Tags Terminal
// @Summary UpdateTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Terminal true "UpdateTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /terminal/updateTerminal [put]
func (terminalApi *TerminalApi) UpdateTerminal(c *gin.Context) {
	var terminal autocode.Terminal
	_ = c.ShouldBindJSON(&terminal)
	if err := terminalService.UpdateTerminal(terminal); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindTerminal query by idTerminal
// @Tags Terminal
// @Summary query by idTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Terminal true "query by idTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /terminal/findTerminal [get]
func (terminalApi *TerminalApi) FindTerminal(c *gin.Context) {
	var terminal autocode.Terminal
	_ = c.ShouldBindQuery(&terminal)
	if err, reterminal := terminalService.GetTerminal(terminal.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reterminal": reterminal}, c)
	}
}

// GetTerminalList Paging acquisitionTerminalList
// @Tags Terminal
// @Summary Paging acquisitionTerminal List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.TerminalSearch true "PagingTerminallist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminal/getTerminalList [get]
func (terminalApi *TerminalApi) GetTerminalList(c *gin.Context) {
	var pageInfo autocodeReq.TerminalSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := terminalService.GetTerminalInfoList(pageInfo); err != nil {
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
