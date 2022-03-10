import service from '@/utils/request'

// @Tags {{.StructName}}
// @Summary create{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.{{.StructName}} true "create{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /{{.Abbreviation}}/create{{.StructName}} [post]
export const create{{.StructName}} = (data) => {
  return service({
    url: '/{{.Abbreviation}}/create{{.StructName}}',
    method: 'post',
    data
  })
}

// @Tags {{.StructName}}
// @Summary delete{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.{{.StructName}} true "delete{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /{{.Abbreviation}}/delete{{.StructName}} [delete]
export const delete{{.StructName}} = (data) => {
  return service({
    url: '/{{.Abbreviation}}/delete{{.StructName}}',
    method: 'delete',
    data
  })
}

// @Tags {{.StructName}}
// @Summary delete{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletion{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /{{.Abbreviation}}/delete{{.StructName}} [delete]
export const delete{{.StructName}}ByIds = (data) => {
  return service({
    url: '/{{.Abbreviation}}/delete{{.StructName}}ByIds',
    method: 'delete',
    data
  })
}

// @Tags {{.StructName}}
// @Summary update{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.{{.StructName}} true "update{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /{{.Abbreviation}}/update{{.StructName}} [put]
export const update{{.StructName}} = (data) => {
  return service({
    url: '/{{.Abbreviation}}/update{{.StructName}}',
    method: 'put',
    data
  })
}

// @Tags {{.StructName}}
// @Summary query by id{{.StructName}}
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.{{.StructName}} true "query by id{{.StructName}}"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /{{.Abbreviation}}/find{{.StructName}} [get]
export const find{{.StructName}} = (params) => {
  return service({
    url: '/{{.Abbreviation}}/find{{.StructName}}',
    method: 'get',
    params
  })
}

// @Tags {{.StructName}}
// @Summary Paging acquisition{{.StructName}}list
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisition{{.StructName}}list"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /{{.Abbreviation}}/get{{.StructName}}List [get]
export const get{{.StructName}}List = (params) => {
  return service({
    url: '/{{.Abbreviation}}/get{{.StructName}}List',
    method: 'get',
    params
  })
}
