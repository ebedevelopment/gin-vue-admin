package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type FrontendsRouter struct {
}

// InitFrontendsRouter initialization Frontends routing information
func (s *FrontendsRouter) InitFrontendsRouter(Router *gin.RouterGroup) {
	frontendsRouter := Router.Group("frontends").Use(middleware.OperationRecord())
	frontendsRouterWithoutRecord := Router.Group("frontends")
	var frontendsApi = v1.ApiGroupApp.AutoCodeApiGroup.FrontendsApi
	{
		frontendsRouter.POST("createFrontends", frontendsApi.CreateFrontends)   // CreateFrontends
		frontendsRouter.DELETE("deleteFrontends", frontendsApi.DeleteFrontends) // DeleteFrontends
		frontendsRouter.DELETE("deleteFrontendsByIds", frontendsApi.DeleteFrontendsByIds) // batch deletionFrontends
		frontendsRouter.PUT("updateFrontends", frontendsApi.UpdateFrontends)    // renewFrontends
	}
	{
		frontendsRouterWithoutRecord.GET("findFrontends", frontendsApi.FindFrontends)        // Get by IDFrontends
		frontendsRouterWithoutRecord.GET("getFrontendsList", frontendsApi.GetFrontendsList)  // ObtainFrontendslist
	}
}
