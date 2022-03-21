package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type MerchantRouter struct {
}

// InitMerchantRouter 初始化 Merchant 路由信息
func (s *MerchantRouter) InitMerchantRouter(Router *gin.RouterGroup) {
	merchantRouter := Router.Group("merchant").Use(middleware.OperationRecord())
	merchantRouterWithoutRecord := Router.Group("merchant")
	var merchantApi = v1.ApiGroupApp.AutoCodeApiGroup.MerchantApi
	{
		merchantRouter.POST("createMerchant", merchantApi.CreateMerchant)   // 新建Merchant
		merchantRouter.DELETE("deleteMerchant", merchantApi.DeleteMerchant) // 删除Merchant
		merchantRouter.DELETE("deleteMerchantByIds", merchantApi.DeleteMerchantByIds) // 批量删除Merchant
		merchantRouter.PUT("updateMerchant", merchantApi.UpdateMerchant)    // 更新Merchant
	}
	{
		merchantRouterWithoutRecord.GET("findMerchant", merchantApi.FindMerchant)        // 根据ID获取Merchant
		merchantRouterWithoutRecord.GET("getMerchantList", merchantApi.GetMerchantList)  // 获取Merchant列表
	}
}
