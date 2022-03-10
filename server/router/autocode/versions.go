package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type VersionsRouter struct {
}

// InitVersionsRouter initialization Versions routing information
func (s *VersionsRouter) InitVersionsRouter(Router *gin.RouterGroup) {
	versionsRouter := Router.Group("versions").Use(middleware.OperationRecord())
	versionsRouterWithoutRecord := Router.Group("versions")
	var versionsApi = v1.ApiGroupApp.AutoCodeApiGroup.VersionsApi
	{
		versionsRouter.POST("createVersions", versionsApi.CreateVersions)   // CreateVersions
		versionsRouter.DELETE("deleteVersions", versionsApi.DeleteVersions) // DeleteVersions
		versionsRouter.DELETE("deleteVersionsByIds", versionsApi.DeleteVersionsByIds) // batch deletionVersions
		versionsRouter.PUT("updateVersions", versionsApi.UpdateVersions)    // renewVersions
	}
	{
		versionsRouterWithoutRecord.GET("findVersions", versionsApi.FindVersions)        // Get by IDVersions
		versionsRouterWithoutRecord.GET("getVersionsList", versionsApi.GetVersionsList)  // ObtainVersionslist
	}
}
