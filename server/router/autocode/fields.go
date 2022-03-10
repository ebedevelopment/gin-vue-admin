package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type FieldsRouter struct {
}

// InitFieldsRouter initialization Fields routing information
func (s *FieldsRouter) InitFieldsRouter(Router *gin.RouterGroup) {
	fieldsRouter := Router.Group("fields").Use(middleware.OperationRecord())
	fieldsRouterWithoutRecord := Router.Group("fields")
	var fieldsApi = v1.ApiGroupApp.AutoCodeApiGroup.FieldsApi
	{
		fieldsRouter.POST("createFields", fieldsApi.CreateFields)   // CreateFields
		fieldsRouter.DELETE("deleteFields", fieldsApi.DeleteFields) // DeleteFields
		fieldsRouter.DELETE("deleteFieldsByIds", fieldsApi.DeleteFieldsByIds) // batch deletionFields
		fieldsRouter.PUT("updateFields", fieldsApi.UpdateFields)    // renewFields
	}
	{
		fieldsRouterWithoutRecord.GET("findFields", fieldsApi.FindFields)        // Get by IDFields
		fieldsRouterWithoutRecord.GET("getFieldsList", fieldsApi.GetFieldsList)  // ObtainFieldslist
	}
}
