package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type CategoriesRouter struct {
}

// InitCategoriesRouter 初始化 Categories 路由信息
func (s *CategoriesRouter) InitCategoriesRouter(Router *gin.RouterGroup) {
	categoriesRouter := Router.Group("categories").Use(middleware.OperationRecord())
	categoriesRouterWithoutRecord := Router.Group("categories")
	var categoriesApi = v1.ApiGroupApp.AutoCodeApiGroup.CategoriesApi
	{
		categoriesRouter.POST("createCategories", categoriesApi.CreateCategories)   // 新建Categories
		categoriesRouter.DELETE("deleteCategories", categoriesApi.DeleteCategories) // 删除Categories
		categoriesRouter.DELETE("deleteCategoriesByIds", categoriesApi.DeleteCategoriesByIds) // 批量删除Categories
		categoriesRouter.PUT("updateCategories", categoriesApi.UpdateCategories)    // 更新Categories
	}
	{
		categoriesRouterWithoutRecord.GET("findCategories", categoriesApi.FindCategories)        // 根据ID获取Categories
		categoriesRouterWithoutRecord.GET("getCategoriesList", categoriesApi.GetCategoriesList)  // 获取Categories列表
	}
}
