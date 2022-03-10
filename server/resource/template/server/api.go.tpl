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

type {{.StructName}}Api struct {
}

var {{.Abbreviation}}Service = service.ServiceGroupApp.AutoCodeServiceGroup.{{.StructName}}Service


// Create{{.StructName}} Create{{.StructName}}
// @Tags {{.StructName}}
// @Summary Create{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.{{.StructName}} true "创建{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /{{.Abbreviation}}/create{{.StructName}} [post]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Create{{.StructName}}(c *gin.Context) {
	var {{.Abbreviation}} autocode.{{.StructName}}
	_ = c.ShouldBindJSON(&{{.Abbreviation}})
	if err := {{.Abbreviation}}Service.Create{{.StructName}}({{.Abbreviation}}); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// Delete{{.StructName}} Delete{{.StructName}}
// @Tags {{.StructName}}
// @Summary Delete{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.{{.StructName}} true "Delete{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /{{.Abbreviation}}/delete{{.StructName}} [delete]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Delete{{.StructName}}(c *gin.Context) {
	var {{.Abbreviation}} autocode.{{.StructName}}
	_ = c.ShouldBindJSON(&{{.Abbreviation}})
	if err := {{.Abbreviation}}Service.Delete{{.StructName}}({{.Abbreviation}}); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// Delete{{.StructName}}ByIds batch deletion{{.StructName}}
// @Tags {{.StructName}}
// @Summary batch deletion{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletion{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /{{.Abbreviation}}/delete{{.StructName}}ByIds [delete]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Delete{{.StructName}}ByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := {{.Abbreviation}}Service.Delete{{.StructName}}ByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// Update{{.StructName}} Update{{.StructName}}
// @Tags {{.StructName}}
// @Summary Update{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.{{.StructName}} true "Update{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /{{.Abbreviation}}/update{{.StructName}} [put]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Update{{.StructName}}(c *gin.Context) {
	var {{.Abbreviation}} autocode.{{.StructName}}
	_ = c.ShouldBindJSON(&{{.Abbreviation}})
	if err := {{.Abbreviation}}Service.Update{{.StructName}}({{.Abbreviation}}); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// Find{{.StructName}} query by id{{.StructName}}
// @Tags {{.StructName}}
// @Summary query by id{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.{{.StructName}} true "query by id{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /{{.Abbreviation}}/find{{.StructName}} [get]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Find{{.StructName}}(c *gin.Context) {
	var {{.Abbreviation}} autocode.{{.StructName}}
	_ = c.ShouldBindQuery(&{{.Abbreviation}})
	if err, re{{.Abbreviation}} := {{.Abbreviation}}Service.Get{{.StructName}}({{.Abbreviation}}.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"re{{.Abbreviation}}": re{{.Abbreviation}}}, c)
	}
}

// Get{{.StructName}}List Paging acquisition{{.StructName}}List
// @Tags {{.StructName}}
// @Summary Paging acquisition{{.StructName}} List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.{{.StructName}}Search true "分页获取{{.StructName}}列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /{{.Abbreviation}}/get{{.StructName}}List [get]
func ({{.Abbreviation}}Api *{{.StructName}}Api) Get{{.StructName}}List(c *gin.Context) {
	var pageInfo autocodeReq.{{.StructName}}Search
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := {{.Abbreviation}}Service.Get{{.StructName}}InfoList(pageInfo); err != nil {
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
