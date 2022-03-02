package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PackagesRouter struct {
}

// InitPackagesRouter initialization Packages routing information
func (s *PackagesRouter) InitPackagesRouter(Router *gin.RouterGroup) {
	packagesRouter := Router.Group("packages").Use(middleware.OperationRecord())
	packagesRouterWithoutRecord := Router.Group("packages")
	var packagesApi = v1.ApiGroupApp.AutoCodeApiGroup.PackagesApi
	{
		packagesRouter.POST("createPackages", packagesApi.CreatePackages)   // CreatePackages
		packagesRouter.DELETE("deletePackages", packagesApi.DeletePackages) // DeletePackages
		packagesRouter.DELETE("deletePackagesByIds", packagesApi.DeletePackagesByIds) // batch deletionPackages
		packagesRouter.PUT("updatePackages", packagesApi.UpdatePackages)    // renewPackages
	}
	{
		packagesRouterWithoutRecord.GET("findPackages", packagesApi.FindPackages)        // Get by IDPackages
		packagesRouterWithoutRecord.GET("getPackagesList", packagesApi.GetPackagesList)  // ObtainPackageslist
	}
}
