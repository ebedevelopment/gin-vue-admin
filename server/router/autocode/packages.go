package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PackagesRouter struct {
}

// InitPackagesRouter 初始化 Packages 路由信息
func (s *PackagesRouter) InitPackagesRouter(Router *gin.RouterGroup) {
	packagesRouter := Router.Group("packages").Use(middleware.OperationRecord())
	packagesRouterWithoutRecord := Router.Group("packages")
	var packagesApi = v1.ApiGroupApp.AutoCodeApiGroup.PackagesApi
	{
		packagesRouter.POST("createPackages", packagesApi.CreatePackages)   // 新建Packages
		packagesRouter.DELETE("deletePackages", packagesApi.DeletePackages) // 删除Packages
		packagesRouter.DELETE("deletePackagesByIds", packagesApi.DeletePackagesByIds) // 批量删除Packages
		packagesRouter.PUT("updatePackages", packagesApi.UpdatePackages)    // 更新Packages
	}
	{
		packagesRouterWithoutRecord.GET("findPackages", packagesApi.FindPackages)        // 根据ID获取Packages
		packagesRouterWithoutRecord.GET("getPackagesList", packagesApi.GetPackagesList)  // 获取Packages列表
	}
}
