package autocode

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ServiceFieldsRouter struct {
}

// InitServiceFieldsRouter 初始化 Fields 路由信息
func (s *ServiceFieldsRouter) InitServiceFieldsRouter(Router *gin.RouterGroup) {
	fieldsRouter := Router.Group("servicefields").Use(middleware.OperationRecord())

	var servicefieldsApi = v1.ApiGroupApp.AutoCodeApiGroup.ServiceFieldsApi
	{
		fieldsRouter.POST("createServiceFields", servicefieldsApi.CreateServiceFields) // 新建Fields

	}

}
