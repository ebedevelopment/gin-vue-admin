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

type CategoriesApi struct {
}

var categoriesService = service.ServiceGroupApp.AutoCodeServiceGroup.CategoriesService


// CreateCategories 创建Categories
// @Tags Categories
// @Summary 创建Categories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "创建Categories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /categories/createCategories [post]
func (categoriesApi *CategoriesApi) CreateCategories(c *gin.Context) {
	var categories autocode.Categories
	_ = c.ShouldBindJSON(&categories)
	if err := categoriesService.CreateCategories(categories); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteCategories 删除Categories
// @Tags Categories
// @Summary 删除Categories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "删除Categories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /categories/deleteCategories [delete]
func (categoriesApi *CategoriesApi) DeleteCategories(c *gin.Context) {
	var categories autocode.Categories
	_ = c.ShouldBindJSON(&categories)
	if err := categoriesService.DeleteCategories(categories); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteCategoriesByIds 批量删除Categories
// @Tags Categories
// @Summary 批量删除Categories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Categories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /categories/deleteCategoriesByIds [delete]
func (categoriesApi *CategoriesApi) DeleteCategoriesByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := categoriesService.DeleteCategoriesByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateCategories 更新Categories
// @Tags Categories
// @Summary 更新Categories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "更新Categories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /categories/updateCategories [put]
func (categoriesApi *CategoriesApi) UpdateCategories(c *gin.Context) {
	var categories autocode.Categories
	_ = c.ShouldBindJSON(&categories)
	if err := categoriesService.UpdateCategories(categories); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindCategories 用id查询Categories
// @Tags Categories
// @Summary 用id查询Categories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Categories true "用id查询Categories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /categories/findCategories [get]
func (categoriesApi *CategoriesApi) FindCategories(c *gin.Context) {
	var categories autocode.Categories
	_ = c.ShouldBindQuery(&categories)
	if err, recategories := categoriesService.GetCategories(categories.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"recategories": recategories}, c)
	}
}

// GetCategoriesList 分页获取Categories列表
// @Tags Categories
// @Summary 分页获取Categories列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.CategoriesSearch true "分页获取Categories列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /categories/getCategoriesList [get]
func (categoriesApi *CategoriesApi) GetCategoriesList(c *gin.Context) {
	var pageInfo autocodeReq.CategoriesSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := categoriesService.GetCategoriesInfoList(pageInfo); err != nil {
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
