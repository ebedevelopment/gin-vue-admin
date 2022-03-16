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

var frontendsService = service.ServiceGroupApp.AutoCodeServiceGroup.VersionsService


// CreateVersions 创建Versions
// @Tags Versions
// @Summary 创建Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "创建Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/createVersions [post]
func (frontendsApi *VersionsApi) CreateVersions(c *gin.Context) {
	var frontends autocode.Versions
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.CreateVersions(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteVersions 删除Versions
// @Tags Versions
// @Summary 删除Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "删除Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /frontends/deleteVersions [delete]
func (frontendsApi *VersionsApi) DeleteVersions(c *gin.Context) {
	var frontends autocode.Versions
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.DeleteVersions(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteVersionsByIds 批量删除Versions
// @Tags Versions
// @Summary 批量删除Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /frontends/deleteVersionsByIds [delete]
func (frontendsApi *VersionsApi) DeleteVersionsByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := frontendsService.DeleteVersionsByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateVersions 更新Versions
// @Tags Versions
// @Summary 更新Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Versions true "更新Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /frontends/updateVersions [put]
func (frontendsApi *VersionsApi) UpdateVersions(c *gin.Context) {
	var frontends autocode.Versions
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.UpdateVersions(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindVersions 用id查询Versions
// @Tags Versions
// @Summary 用id查询Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Versions true "用id查询Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /frontends/findVersions [get]
func (frontendsApi *VersionsApi) FindVersions(c *gin.Context) {
	var frontends autocode.Versions
	_ = c.ShouldBindQuery(&frontends)
	if err, refrontends := frontendsService.GetVersions(frontends.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"refrontends": refrontends}, c)
	}
}

// GetVersionsList 分页获取Versions列表
// @Tags Versions
// @Summary 分页获取Versions列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.VersionsSearch true "分页获取Versions列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/getVersionsList [get]
func (frontendsApi *VersionsApi) GetVersionsList(c *gin.Context) {
	var pageInfo autocodeReq.VersionsSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := frontendsService.GetVersionsInfoList(pageInfo); err != nil {
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
