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


// CreateCategories CreateCategories
// @Tags Categories
// @Summary CreateCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "CreateCategories"
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

// DeleteCategories DeleteCategories
// @Tags Categories
// @Summary DeleteCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "DeleteCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
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

// DeleteCategoriesByIds batch deletionCategories
// @Tags Categories
// @Summary batch deletionCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
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

// UpdateCategories UpdateCategories
// @Tags Categories
// @Summary UpdateCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Categories true "UpdateCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
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

// FindCategories query by idCategories
// @Tags Categories
// @Summary query by idCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Categories true "query by idCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
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

// GetCategoriesList Paging acquisitionCategoriesList
// @Tags Categories
// @Summary Paging acquisitionCategories List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.CategoriesSearch true "PagingCategorieslist"
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
