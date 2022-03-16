package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type GatewaysRouter struct {
}

// InitGatewaysRouter 初始化 Gateways 路由信息
func (s *GatewaysRouter) InitGatewaysRouter(Router *gin.RouterGroup) {
	gatewaysRouter := Router.Group("gateways").Use(middleware.OperationRecord())
	gatewaysRouterWithoutRecord := Router.Group("gateways")
	var gatewaysApi = v1.ApiGroupApp.AutoCodeApiGroup.GatewaysApi
	{
		gatewaysRouter.POST("createGateways", gatewaysApi.CreateGateways)   // 新建Gateways
		gatewaysRouter.DELETE("deleteGateways", gatewaysApi.DeleteGateways) // 删除Gateways
		gatewaysRouter.DELETE("deleteGatewaysByIds", gatewaysApi.DeleteGatewaysByIds) // 批量删除Gateways
		gatewaysRouter.PUT("updateGateways", gatewaysApi.UpdateGateways)    // 更新Gateways
	}
	{
		gatewaysRouterWithoutRecord.GET("findGateways", gatewaysApi.FindGateways)        // 根据ID获取Gateways
		gatewaysRouterWithoutRecord.GET("getGatewaysList", gatewaysApi.GetGatewaysList)  // 获取Gateways列表
	}
}
