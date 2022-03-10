package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type TerminalRouter struct {
}

// InitTerminalRouter initialization Terminal routing information
func (s *TerminalRouter) InitTerminalRouter(Router *gin.RouterGroup) {
	terminalRouter := Router.Group("terminal").Use(middleware.OperationRecord())
	terminalRouterWithoutRecord := Router.Group("terminal")
	var terminalApi = v1.ApiGroupApp.AutoCodeApiGroup.TerminalApi
	{
		terminalRouter.POST("createTerminal", terminalApi.CreateTerminal)   // CreateTerminal
		terminalRouter.DELETE("deleteTerminal", terminalApi.DeleteTerminal) // DeleteTerminal
		terminalRouter.DELETE("deleteTerminalByIds", terminalApi.DeleteTerminalByIds) // batch deletionTerminal
		terminalRouter.PUT("updateTerminal", terminalApi.UpdateTerminal)    // renewTerminal
	}
	{
		terminalRouterWithoutRecord.GET("findTerminal", terminalApi.FindTerminal)        // Get by IDTerminal
		terminalRouterWithoutRecord.GET("getTerminalList", terminalApi.GetTerminalList)  // ObtainTerminallist
	}
}
