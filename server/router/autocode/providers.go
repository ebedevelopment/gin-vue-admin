package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ProvidersRouter struct {
}

// InitProvidersRouter 初始化 Providers 路由信息
func (s *ProvidersRouter) InitProvidersRouter(Router *gin.RouterGroup) {
	providersRouter := Router.Group("providers").Use(middleware.OperationRecord())
	providersRouterWithoutRecord := Router.Group("providers")
	var providersApi = v1.ApiGroupApp.AutoCodeApiGroup.ProvidersApi
	{
		providersRouter.POST("createProviders", providersApi.CreateProviders)   // 新建Providers
		providersRouter.DELETE("deleteProviders", providersApi.DeleteProviders) // 删除Providers
		providersRouter.DELETE("deleteProvidersByIds", providersApi.DeleteProvidersByIds) // 批量删除Providers
		providersRouter.PUT("updateProviders", providersApi.UpdateProviders)    // 更新Providers
	}
	{
		providersRouterWithoutRecord.GET("findProviders", providersApi.FindProviders)        // 根据ID获取Providers
		providersRouterWithoutRecord.GET("getProvidersList", providersApi.GetProvidersList)  // 获取Providers列表
	}
}
