package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type MerchantRouter struct {
}

// InitMerchantRouter initialization Merchant routing information
func (s *MerchantRouter) InitMerchantRouter(Router *gin.RouterGroup) {
	merchantRouter := Router.Group("merchant").Use(middleware.OperationRecord())
	merchantRouterWithoutRecord := Router.Group("merchant")
	var merchantApi = v1.ApiGroupApp.AutoCodeApiGroup.MerchantApi
	{
		merchantRouter.POST("createMerchant", merchantApi.CreateMerchant)   // CreateMerchant
		merchantRouter.DELETE("deleteMerchant", merchantApi.DeleteMerchant) // DeleteMerchant
		merchantRouter.DELETE("deleteMerchantByIds", merchantApi.DeleteMerchantByIds) // batch deletionMerchant
		merchantRouter.PUT("updateMerchant", merchantApi.UpdateMerchant)    // renewMerchant
	}
	{
		merchantRouterWithoutRecord.GET("findMerchant", merchantApi.FindMerchant)        // Get by IDMerchant
		merchantRouterWithoutRecord.GET("getMerchantList", merchantApi.GetMerchantList)  // ObtainMerchantlist
	}
}
