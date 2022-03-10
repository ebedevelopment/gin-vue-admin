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


// CreateFields CreateFields
// @Tags Fields
// @Summary CreateFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "CreateFields"
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

// DeleteFields DeleteFields
// @Tags Fields
// @Summary DeleteFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "DeleteFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
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

// DeleteFieldsByIds batch deletionFields
// @Tags Fields
// @Summary batch deletionFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
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

// UpdateFields UpdateFields
// @Tags Fields
// @Summary UpdateFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Fields true "UpdateFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
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

// FindFields query by idFields
// @Tags Fields
// @Summary query by idFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Fields true "query by idFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
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

// GetFieldsList Paging acquisitionFieldsList
// @Tags Fields
// @Summary Paging acquisitionFields List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.FieldsSearch true "PagingFieldslist"
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
