package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type AutoCodeExampleApi struct{}

var autoCodeExampleService = service.ServiceGroupApp.AutoCodeServiceGroup.AutoCodeExampleService

// @Tags AutoCodeExample
// @Summary 创建AutoCodeExample
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.AutoCodeExample true "AutoCodeExample模型"
// @Success 200 {object} response.Response{msg=string} "创建AutoCodeExample"
// @Router /autoCodeExample/createAutoCodeExample [post]
func (autoCodeExampleApi *AutoCodeExampleApi) CreateAutoCodeExample(c *gin.Context) {
	var autoCodeExample autocode.AutoCodeExample
	_ = c.ShouldBindJSON(&autoCodeExample)
	if err := autoCodeExampleService.CreateAutoCodeExample(autoCodeExample); err != nil {
		global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// @Tags AutoCodeExample
// @Summary 删除AutoCodeExample
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.AutoCodeExample true "AutoCodeExample模型"
// @Success 200 {object} response.Response{msg=string} "删除AutoCodeExample"
// @Router /autoCodeExample/deleteAutoCodeExample [delete]
func (autoCodeExampleApi *AutoCodeExampleApi) DeleteAutoCodeExample(c *gin.Context) {
	var autoCodeExample autocode.AutoCodeExample
	_ = c.ShouldBindJSON(&autoCodeExample)
	if err := autoCodeExampleService.DeleteAutoCodeExample(autoCodeExample); err != nil {
		global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// @Tags AutoCodeExample
// @Summary 更新AutoCodeExample
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.AutoCodeExample true "更新AutoCodeExample"
// @Success 200 {object} response.Response{msg=string} "更新AutoCodeExample"
// @Router /autoCodeExample/updateAutoCodeExample [put]
func (autoCodeExampleApi *AutoCodeExampleApi) UpdateAutoCodeExample(c *gin.Context) {
	var autoCodeExample autocode.AutoCodeExample
	_ = c.ShouldBindJSON(&autoCodeExample)
	if err := autoCodeExampleService.UpdateAutoCodeExample(&autoCodeExample); err != nil {
		global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// @Tags AutoCodeExample
// @Summary 用id查询AutoCodeExample
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.AutoCodeExample true "用id查询AutoCodeExample"
// @Success 200 {object} response.Response{data=map[string]interface{},msg=string} "用id查询AutoCodeExample"
// @Router /autoCodeExample/findAutoCodeExample [get]
func (autoCodeExampleApi *AutoCodeExampleApi) FindAutoCodeExample(c *gin.Context) {
	var autoCodeExample autocode.AutoCodeExample
	_ = c.ShouldBindQuery(&autoCodeExample)
	if err := utils.Verify(autoCodeExample, utils.IdVerify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err, reAutoCodeExample := autoCodeExampleService.GetAutoCodeExample(autoCodeExample.ID); err != nil {
		global.GVA_LOG.Error(global.Translate("general.queryFailErr"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithDetailed(gin.H{"reAutoCodeExample": reAutoCodeExample}, global.Translate("general.querySuccess"), c)
	}
}

// @Tags AutoCodeExample
// @Summary 分页获取AutoCodeExample列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.AutoCodeExampleSearch true "页码, 每页大小, 搜索条件"
// @Success 200 {object} response.Response{data=response.PageResult,msg=string} "分页获取AutoCodeExample列表,返回包括列表,总数,页码,每页数量"
// @Router /autoCodeExample/getAutoCodeExampleList [get]
func (autoCodeExampleApi *AutoCodeExampleApi) GetAutoCodeExampleList(c *gin.Context) {
	var pageInfo autocodeReq.AutoCodeExampleSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := autoCodeExampleService.GetAutoCodeExampleInfoList(pageInfo); err != nil {
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