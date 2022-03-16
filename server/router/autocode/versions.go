package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type VersionsRouter struct {
}

// InitVersionsRouter 初始化 Versions 路由信息
func (s *VersionsRouter) InitVersionsRouter(Router *gin.RouterGroup) {
	frontendsRouter := Router.Group("frontends").Use(middleware.OperationRecord())
	frontendsRouterWithoutRecord := Router.Group("frontends")
	var frontendsApi = v1.ApiGroupApp.AutoCodeApiGroup.VersionsApi
	{
		frontendsRouter.POST("createVersions", frontendsApi.CreateVersions)   // 新建Versions
		frontendsRouter.DELETE("deleteVersions", frontendsApi.DeleteVersions) // 删除Versions
		frontendsRouter.DELETE("deleteVersionsByIds", frontendsApi.DeleteVersionsByIds) // 批量删除Versions
		frontendsRouter.PUT("updateVersions", frontendsApi.UpdateVersions)    // 更新Versions
	}
	{
		frontendsRouterWithoutRecord.GET("findVersions", frontendsApi.FindVersions)        // 根据ID获取Versions
		frontendsRouterWithoutRecord.GET("getVersionsList", frontendsApi.GetVersionsList)  // 获取Versions列表
	}
}
