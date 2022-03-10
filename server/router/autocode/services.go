package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ServicesRouter struct {
}

// InitServicesRouter initialization Services routing information
func (s *ServicesRouter) InitServicesRouter(Router *gin.RouterGroup) {
	servicesRouter := Router.Group("services").Use(middleware.OperationRecord())
	servicesRouterWithoutRecord := Router.Group("services")
	var servicesApi = v1.ApiGroupApp.AutoCodeApiGroup.ServicesApi
	{
		servicesRouter.POST("createServices", servicesApi.CreateServices)   // CreateServices
		servicesRouter.DELETE("deleteServices", servicesApi.DeleteServices) // DeleteServices
		servicesRouter.DELETE("deleteServicesByIds", servicesApi.DeleteServicesByIds) // batch deletionServices
		servicesRouter.PUT("updateServices", servicesApi.UpdateServices)    // renewServices
	}
	{
		servicesRouterWithoutRecord.GET("findServices", servicesApi.FindServices)        // Get by IDServices
		servicesRouterWithoutRecord.GET("getServicesList", servicesApi.GetServicesList)  // ObtainServiceslist
	}
}
