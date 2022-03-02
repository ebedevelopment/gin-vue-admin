package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type CategoriesRouter struct {
}

// InitCategoriesRouter initialization Categories routing information
func (s *CategoriesRouter) InitCategoriesRouter(Router *gin.RouterGroup) {
	categoriesRouter := Router.Group("categories").Use(middleware.OperationRecord())
	categoriesRouterWithoutRecord := Router.Group("categories")
	var categoriesApi = v1.ApiGroupApp.AutoCodeApiGroup.CategoriesApi
	{
		categoriesRouter.POST("createCategories", categoriesApi.CreateCategories)   // CreateCategories
		categoriesRouter.DELETE("deleteCategories", categoriesApi.DeleteCategories) // DeleteCategories
		categoriesRouter.DELETE("deleteCategoriesByIds", categoriesApi.DeleteCategoriesByIds) // batch deletionCategories
		categoriesRouter.PUT("updateCategories", categoriesApi.UpdateCategories)    // renewCategories
	}
	{
		categoriesRouterWithoutRecord.GET("findCategories", categoriesApi.FindCategories)        // Get by IDCategories
		categoriesRouterWithoutRecord.GET("getCategoriesList", categoriesApi.GetCategoriesList)  // ObtainCategorieslist
	}
}
