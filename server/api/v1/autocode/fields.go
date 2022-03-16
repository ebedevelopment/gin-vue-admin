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

type FieldsApi struct {
}

var fieldsService = service.ServiceGroupApp.AutoCodeServiceGroup.FieldsService


// CreateFields 创建Fields
// @Tags Fields
// @Summary 创建Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "创建Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /fields/createFields [post]
func (fieldsApi *FieldsApi) CreateFields(c *gin.Context) {
	var fields autocode.Fields
	_ = c.ShouldBindJSON(&fields)
	if err := fieldsService.CreateFields(fields); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteFields 删除Fields
// @Tags Fields
// @Summary 删除Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "删除Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /fields/deleteFields [delete]
func (fieldsApi *FieldsApi) DeleteFields(c *gin.Context) {
	var fields autocode.Fields
	_ = c.ShouldBindJSON(&fields)
	if err := fieldsService.DeleteFields(fields); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteFieldsByIds 批量删除Fields
// @Tags Fields
// @Summary 批量删除Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /fields/deleteFieldsByIds [delete]
func (fieldsApi *FieldsApi) DeleteFieldsByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := fieldsService.DeleteFieldsByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateFields 更新Fields
// @Tags Fields
// @Summary 更新Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "更新Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /fields/updateFields [put]
func (fieldsApi *FieldsApi) UpdateFields(c *gin.Context) {
	var fields autocode.Fields
	_ = c.ShouldBindJSON(&fields)
	if err := fieldsService.UpdateFields(fields); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindFields 用id查询Fields
// @Tags Fields
// @Summary 用id查询Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Fields true "用id查询Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /fields/findFields [get]
func (fieldsApi *FieldsApi) FindFields(c *gin.Context) {
	var fields autocode.Fields
	_ = c.ShouldBindQuery(&fields)
	if err, refields := fieldsService.GetFields(fields.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"refields": refields}, c)
	}
}

// GetFieldsList 分页获取Fields列表
// @Tags Fields
// @Summary 分页获取Fields列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.FieldsSearch true "分页获取Fields列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /fields/getFieldsList [get]
func (fieldsApi *FieldsApi) GetFieldsList(c *gin.Context) {
	var pageInfo autocodeReq.FieldsSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := fieldsService.GetFieldsInfoList(pageInfo); err != nil {
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
