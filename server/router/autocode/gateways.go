package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type GatewaysRouter struct {
}

// InitGatewaysRouter initialization Gateways routing information
func (s *GatewaysRouter) InitGatewaysRouter(Router *gin.RouterGroup) {
	gatewaysRouter := Router.Group("gateways").Use(middleware.OperationRecord())
	gatewaysRouterWithoutRecord := Router.Group("gateways")
	var gatewaysApi = v1.ApiGroupApp.AutoCodeApiGroup.GatewaysApi
	{
		gatewaysRouter.POST("createGateways", gatewaysApi.CreateGateways)   // CreateGateways
		gatewaysRouter.DELETE("deleteGateways", gatewaysApi.DeleteGateways) // DeleteGateways
		gatewaysRouter.DELETE("deleteGatewaysByIds", gatewaysApi.DeleteGatewaysByIds) // batch deletionGateways
		gatewaysRouter.PUT("updateGateways", gatewaysApi.UpdateGateways)    // renewGateways
	}
	{
		gatewaysRouterWithoutRecord.GET("findGateways", gatewaysApi.FindGateways)        // Get by IDGateways
		gatewaysRouterWithoutRecord.GET("getGatewaysList", gatewaysApi.GetGatewaysList)  // ObtainGatewayslist
	}
}
