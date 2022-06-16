package autocode

import (
	"encoding/json"
	"fmt"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"

	"github.com/gin-gonic/gin"
	// "go.uber.org/zap"
)

type ServiceFieldsApi struct {
}

// var servicefieldsService = service.ServiceGroupApp.AutoCodeServiceGroup.FieldsService

// CreateServiceFields 创建Fields
// @Tags ServiceFields
// @Summary 创建ServiceFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.ServiceFields true "创建Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /servicefields/CreateServiceFields [post]
func (fieldsApi *ServiceFieldsApi) CreateServiceFields(c *gin.Context) {
	var fields autocode.ServiceFields
	_ = c.ShouldBindJSON(&fields)

	byteValueReq, err := json.Marshal(fields)
	fmt.Println(string(byteValueReq))

	if err != nil {
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)

	}

	url := global.GVA_VP.GetString("gateway-controller.url") + "/fields/add"
	fmt.Println(url)
	body, err := global.SendPostReq("POST", byteValueReq, url)
	fmt.Println(string(body))

	if err != nil {

		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {

		response.OkWithMessage(global.Translate("general.success"), c)
	}

}
