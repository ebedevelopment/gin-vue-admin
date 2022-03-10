package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ProvidersRouter struct {
}

// InitProvidersRouter initialization Providers routing information
func (s *ProvidersRouter) InitProvidersRouter(Router *gin.RouterGroup) {
	providersRouter := Router.Group("providers").Use(middleware.OperationRecord())
	providersRouterWithoutRecord := Router.Group("providers")
	var providersApi = v1.ApiGroupApp.AutoCodeApiGroup.ProvidersApi
	{
		providersRouter.POST("createProviders", providersApi.CreateProviders)   // CreateProviders
		providersRouter.DELETE("deleteProviders", providersApi.DeleteProviders) // DeleteProviders
		providersRouter.DELETE("deleteProvidersByIds", providersApi.DeleteProvidersByIds) // batch deletionProviders
		providersRouter.PUT("updateProviders", providersApi.UpdateProviders)    // renewProviders
	}
	{
		providersRouterWithoutRecord.GET("findProviders", providersApi.FindProviders)        // Get by IDProviders
		providersRouterWithoutRecord.GET("getProvidersList", providersApi.GetProvidersList)  // ObtainProviderslist
	}
}
