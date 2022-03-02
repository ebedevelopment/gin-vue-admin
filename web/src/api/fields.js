import service from '@/utils/request'

// @Tags Fields
// @Summary createFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "createFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /fields/createFields [post]
export const createFields = (data) => {
  return service({
    url: '/fields/createFields',
    method: 'post',
    data
  })
}

// @Tags Fields
// @Summary deleteFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "deleteFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /fields/deleteFields [delete]
export const deleteFields = (data) => {
  return service({
    url: '/fields/deleteFields',
    method: 'delete',
    data
  })
}

// @Tags Fields
// @Summary deleteFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /fields/deleteFields [delete]
export const deleteFieldsByIds = (data) => {
  return service({
    url: '/fields/deleteFieldsByIds',
    method: 'delete',
    data
  })
}

// @Tags Fields
// @Summary updateFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "updateFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /fields/updateFields [put]
export const updateFields = (data) => {
  return service({
    url: '/fields/updateFields',
    method: 'put',
    data
  })
}

// @Tags Fields
// @Summary query by idFields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Fields true "query by idFields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /fields/findFields [get]
export const findFields = (params) => {
  return service({
    url: '/fields/findFields',
    method: 'get',
    params
  })
}

// @Tags Fields
// @Summary Paging acquisitionFieldslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionFieldslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /fields/getFieldsList [get]
export const getFieldsList = (params) => {
  return service({
    url: '/fields/getFieldsList',
    method: 'get',
    params
  })
}
