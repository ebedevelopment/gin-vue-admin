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

type VersionsApi struct {
}

var versionsService = service.ServiceGroupApp.AutoCodeServiceGroup.VersionsService


// CreateVersions CreateVersions
// @Tags Versions
// @Summary CreateVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "CreateVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /versions/createVersions [post]
func (versionsApi *VersionsApi) CreateVersions(c *gin.Context) {
	var versions autocode.Versions
	_ = c.ShouldBindJSON(&versions)
	if err := versionsService.CreateVersions(versions); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteVersions DeleteVersions
// @Tags Versions
// @Summary DeleteVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "DeleteVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /versions/deleteVersions [delete]
func (versionsApi *VersionsApi) DeleteVersions(c *gin.Context) {
	var versions autocode.Versions
	_ = c.ShouldBindJSON(&versions)
	if err := versionsService.DeleteVersions(versions); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteVersionsByIds batch deletionVersions
// @Tags Versions
// @Summary batch deletionVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /versions/deleteVersionsByIds [delete]
func (versionsApi *VersionsApi) DeleteVersionsByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := versionsService.DeleteVersionsByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateVersions UpdateVersions
// @Tags Versions
// @Summary UpdateVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "UpdateVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /versions/updateVersions [put]
func (versionsApi *VersionsApi) UpdateVersions(c *gin.Context) {
	var versions autocode.Versions
	_ = c.ShouldBindJSON(&versions)
	if err := versionsService.UpdateVersions(versions); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindVersions query by idVersions
// @Tags Versions
// @Summary query by idVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Versions true "query by idVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /versions/findVersions [get]
func (versionsApi *VersionsApi) FindVersions(c *gin.Context) {
	var versions autocode.Versions
	_ = c.ShouldBindQuery(&versions)
	if err, reversions := versionsService.GetVersions(versions.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reversions": reversions}, c)
	}
}

// GetVersionsList Paging acquisitionVersionsList
// @Tags Versions
// @Summary Paging acquisitionVersions List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.VersionsSearch true "PagingVersionslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /versions/getVersionsList [get]
func (versionsApi *VersionsApi) GetVersionsList(c *gin.Context) {
	var pageInfo autocodeReq.VersionsSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := versionsService.GetVersionsInfoList(pageInfo); err != nil {
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
