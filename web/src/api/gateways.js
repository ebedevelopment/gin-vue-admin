import service from '@/utils/request'

// @Tags Gateways
// @Summary 创建Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "创建Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /gateways/createGateways [post]
export const createGateways = (data) => {
  return service({
    url: '/gateways/createGateways',
    method: 'post',
    data
  })
}

// @Tags Gateways
// @Summary 删除Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "删除Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /gateways/deleteGateways [delete]
export const deleteGateways = (data) => {
  return service({
    url: '/gateways/deleteGateways',
    method: 'delete',
    data
  })
}

// @Tags Gateways
// @Summary 删除Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /gateways/deleteGateways [delete]
export const deleteGatewaysByIds = (data) => {
  return service({
    url: '/gateways/deleteGatewaysByIds',
    method: 'delete',
    data
  })
}

// @Tags Gateways
// @Summary 更新Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "更新Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /gateways/updateGateways [put]
export const updateGateways = (data) => {
  return service({
    url: '/gateways/updateGateways',
    method: 'put',
    data
  })
}

// @Tags Gateways
// @Summary 用id查询Gateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Gateways true "用id查询Gateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /gateways/findGateways [get]
export const findGateways = (params) => {
  return service({
    url: '/gateways/findGateways',
    method: 'get',
    params
  })
}

// @Tags Gateways
// @Summary 分页获取Gateways列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Gateways列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /gateways/getGatewaysList [get]
export const getGatewaysList = (params) => {
  return service({
    url: '/gateways/getGatewaysList',
    method: 'get',
    params
  })
}
// @Tags Gateways
// @Summary 分页获取Gateways列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Gateways列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /gateways/getGatewayServiceFields [post]
export const getGatewayServiceFields = (data) => {
  return service({
    url: '/gateways/getGatewayServiceFields',
    method: 'post',
    data: data
  })
}