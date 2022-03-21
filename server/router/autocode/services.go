package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ServicesRouter struct {
}

// InitServicesRouter 初始化 Services 路由信息
func (s *ServicesRouter) InitServicesRouter(Router *gin.RouterGroup) {
	servicesRouter := Router.Group("services").Use(middleware.OperationRecord())
	servicesRouterWithoutRecord := Router.Group("services")
	var servicesApi = v1.ApiGroupApp.AutoCodeApiGroup.ServicesApi
	{
		servicesRouter.POST("createServices", servicesApi.CreateServices)   // 新建Services
		servicesRouter.DELETE("deleteServices", servicesApi.DeleteServices) // 删除Services
		servicesRouter.DELETE("deleteServicesByIds", servicesApi.DeleteServicesByIds) // 批量删除Services
		servicesRouter.PUT("updateServices", servicesApi.UpdateServices)    // 更新Services
	}
	{
		servicesRouterWithoutRecord.GET("findServices", servicesApi.FindServices)        // 根据ID获取Services
		servicesRouterWithoutRecord.GET("getServicesList", servicesApi.GetServicesList)  // 获取Services列表
	}
}
