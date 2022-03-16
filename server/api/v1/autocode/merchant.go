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

type MerchantApi struct {
}

var merchantService = service.ServiceGroupApp.AutoCodeServiceGroup.MerchantService


// CreateMerchant 创建Merchant
// @Tags Merchant
// @Summary 创建Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Merchant true "创建Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /merchant/createMerchant [post]
func (merchantApi *MerchantApi) CreateMerchant(c *gin.Context) {
	var merchant autocode.Merchant
	_ = c.ShouldBindJSON(&merchant)
	if err := merchantService.CreateMerchant(merchant); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteMerchant 删除Merchant
// @Tags Merchant
// @Summary 删除Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Merchant true "删除Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchant/deleteMerchant [delete]
func (merchantApi *MerchantApi) DeleteMerchant(c *gin.Context) {
	var merchant autocode.Merchant
	_ = c.ShouldBindJSON(&merchant)
	if err := merchantService.DeleteMerchant(merchant); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteMerchantByIds 批量删除Merchant
// @Tags Merchant
// @Summary 批量删除Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /merchant/deleteMerchantByIds [delete]
func (merchantApi *MerchantApi) DeleteMerchantByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := merchantService.DeleteMerchantByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateMerchant 更新Merchant
// @Tags Merchant
// @Summary 更新Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Merchant true "更新Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /merchant/updateMerchant [put]
func (merchantApi *MerchantApi) UpdateMerchant(c *gin.Context) {
	var merchant autocode.Merchant
	_ = c.ShouldBindJSON(&merchant)
	if err := merchantService.UpdateMerchant(merchant); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindMerchant 用id查询Merchant
// @Tags Merchant
// @Summary 用id查询Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Merchant true "用id查询Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /merchant/findMerchant [get]
func (merchantApi *MerchantApi) FindMerchant(c *gin.Context) {
	var merchant autocode.Merchant
	_ = c.ShouldBindQuery(&merchant)
	if err, remerchant := merchantService.GetMerchant(merchant.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"remerchant": remerchant}, c)
	}
}

// GetMerchantList 分页获取Merchant列表
// @Tags Merchant
// @Summary 分页获取Merchant列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.MerchantSearch true "分页获取Merchant列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /merchant/getMerchantList [get]
func (merchantApi *MerchantApi) GetMerchantList(c *gin.Context) {
	var pageInfo autocodeReq.MerchantSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := merchantService.GetMerchantInfoList(pageInfo); err != nil {
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
