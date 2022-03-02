package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type {{.StructName}}Router struct {
}

// Init{{.StructName}}Router initialization {{.StructName}} routing information
func (s *{{.StructName}}Router) Init{{.StructName}}Router(Router *gin.RouterGroup) {
	{{.Abbreviation}}Router := Router.Group("{{.Abbreviation}}").Use(middleware.OperationRecord())
	{{.Abbreviation}}RouterWithoutRecord := Router.Group("{{.Abbreviation}}")
	var {{.Abbreviation}}Api = v1.ApiGroupApp.AutoCodeApiGroup.{{.StructName}}Api
	{
		{{.Abbreviation}}Router.POST("create{{.StructName}}", {{.Abbreviation}}Api.Create{{.StructName}})   // Create{{.StructName}}
		{{.Abbreviation}}Router.DELETE("delete{{.StructName}}", {{.Abbreviation}}Api.Delete{{.StructName}}) // Delete{{.StructName}}
		{{.Abbreviation}}Router.DELETE("delete{{.StructName}}ByIds", {{.Abbreviation}}Api.Delete{{.StructName}}ByIds) // batch deletion{{.StructName}}
		{{.Abbreviation}}Router.PUT("update{{.StructName}}", {{.Abbreviation}}Api.Update{{.StructName}})    // renew{{.StructName}}
	}
	{
		{{.Abbreviation}}RouterWithoutRecord.GET("find{{.StructName}}", {{.Abbreviation}}Api.Find{{.StructName}})        // Get by ID{{.StructName}}
		{{.Abbreviation}}RouterWithoutRecord.GET("get{{.StructName}}List", {{.Abbreviation}}Api.Get{{.StructName}}List)  // Obtain{{.StructName}}list
	}
}
