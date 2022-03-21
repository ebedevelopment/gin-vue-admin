package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TerminalsRouter struct {
}

// InitTerminalsRouter 初始化 Terminals 路由信息
func (s *TerminalsRouter) InitTerminalsRouter(Router *gin.RouterGroup) {
	terminalsRouter := Router.Group("terminals").Use(middleware.OperationRecord())
	terminalsRouterWithoutRecord := Router.Group("terminals")
	var terminalsApi = v1.ApiGroupApp.AutoCodeApiGroup.TerminalsApi
	{
		terminalsRouter.POST("createTerminals", terminalsApi.CreateTerminals)   // 新建Terminals
		terminalsRouter.DELETE("deleteTerminals", terminalsApi.DeleteTerminals) // 删除Terminals
		terminalsRouter.DELETE("deleteTerminalsByIds", terminalsApi.DeleteTerminalsByIds) // 批量删除Terminals
		terminalsRouter.PUT("updateTerminals", terminalsApi.UpdateTerminals)    // 更新Terminals
	}
	{
		terminalsRouterWithoutRecord.GET("findTerminals", terminalsApi.FindTerminals)        // 根据ID获取Terminals
		terminalsRouterWithoutRecord.GET("getTerminalsList", terminalsApi.GetTerminalsList)  // 获取Terminals列表
	}
}
