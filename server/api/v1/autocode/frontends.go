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

type FrontendsApi struct {
}

var frontendsService = service.ServiceGroupApp.AutoCodeServiceGroup.FrontendsService


// CreateFrontends CreateFrontends
// @Tags Frontends
// @Summary CreateFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Frontends true "CreateFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/createFrontends [post]
func (frontendsApi *FrontendsApi) CreateFrontends(c *gin.Context) {
	var frontends autocode.Frontends
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.CreateFrontends(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteFrontends DeleteFrontends
// @Tags Frontends
// @Summary DeleteFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Frontends true "DeleteFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /frontends/deleteFrontends [delete]
func (frontendsApi *FrontendsApi) DeleteFrontends(c *gin.Context) {
	var frontends autocode.Frontends
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.DeleteFrontends(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteFrontendsByIds batch deletionFrontends
// @Tags Frontends
// @Summary batch deletionFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /frontends/deleteFrontendsByIds [delete]
func (frontendsApi *FrontendsApi) DeleteFrontendsByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := frontendsService.DeleteFrontendsByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateFrontends UpdateFrontends
// @Tags Frontends
// @Summary UpdateFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Frontends true "UpdateFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /frontends/updateFrontends [put]
func (frontendsApi *FrontendsApi) UpdateFrontends(c *gin.Context) {
	var frontends autocode.Frontends
	_ = c.ShouldBindJSON(&frontends)
	if err := frontendsService.UpdateFrontends(frontends); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindFrontends query by idFrontends
// @Tags Frontends
// @Summary query by idFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Frontends true "query by idFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /frontends/findFrontends [get]
func (frontendsApi *FrontendsApi) FindFrontends(c *gin.Context) {
	var frontends autocode.Frontends
	_ = c.ShouldBindQuery(&frontends)
	if err, refrontends := frontendsService.GetFrontends(frontends.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"refrontends": refrontends}, c)
	}
}

// GetFrontendsList Paging acquisitionFrontendsList
// @Tags Frontends
// @Summary Paging acquisitionFrontends List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.FrontendsSearch true "PagingFrontendslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/getFrontendsList [get]
func (frontendsApi *FrontendsApi) GetFrontendsList(c *gin.Context) {
	var pageInfo autocodeReq.FrontendsSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := frontendsService.GetFrontendsInfoList(pageInfo); err != nil {
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
