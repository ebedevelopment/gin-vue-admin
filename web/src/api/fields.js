import service from '@/utils/request'

// @Tags Fields
// @Summary 创建Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "创建Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /fields/createFields [post]
export const createFields = (data) => {
  return service({
    url: '/fields/createFields',
    method: 'post',
    data
  })
}

// @Tags Fields
// @Summary 删除Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "删除Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /fields/deleteFields [delete]
export const deleteFields = (data) => {
  return service({
    url: '/fields/deleteFields',
    method: 'delete',
    data
  })
}

// @Tags Fields
// @Summary 删除Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /fields/deleteFields [delete]
export const deleteFieldsByIds = (data) => {
  return service({
    url: '/fields/deleteFieldsByIds',
    method: 'delete',
    data
  })
}

// @Tags Fields
// @Summary 更新Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "更新Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /fields/updateFields [put]
export const updateFields = (data) => {
  return service({
    url: '/fields/updateFields',
    method: 'put',
    data
  })
}

// @Tags Fields
// @Summary 用id查询Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Fields true "用id查询Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /fields/findFields [get]
export const findFields = (params) => {
  return service({
    url: '/fields/findFields',
    method: 'get',
    params
  })
}

// @Tags Fields
// @Summary 分页获取Fields列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Fields列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /fields/getFieldsList [get]
export const getFieldsList = (params) => {
  return service({
    url: '/fields/getFieldsList',
    method: 'get',
    params
  })
}
