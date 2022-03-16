package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type FieldsRouter struct {
}

// InitFieldsRouter 初始化 Fields 路由信息
func (s *FieldsRouter) InitFieldsRouter(Router *gin.RouterGroup) {
	fieldsRouter := Router.Group("fields").Use(middleware.OperationRecord())
	fieldsRouterWithoutRecord := Router.Group("fields")
	var fieldsApi = v1.ApiGroupApp.AutoCodeApiGroup.FieldsApi
	{
		fieldsRouter.POST("createFields", fieldsApi.CreateFields)   // 新建Fields
		fieldsRouter.DELETE("deleteFields", fieldsApi.DeleteFields) // 删除Fields
		fieldsRouter.DELETE("deleteFieldsByIds", fieldsApi.DeleteFieldsByIds) // 批量删除Fields
		fieldsRouter.PUT("updateFields", fieldsApi.UpdateFields)    // 更新Fields
	}
	{
		fieldsRouterWithoutRecord.GET("findFields", fieldsApi.FindFields)        // 根据ID获取Fields
		fieldsRouterWithoutRecord.GET("getFieldsList", fieldsApi.GetFieldsList)  // 获取Fields列表
	}
}
