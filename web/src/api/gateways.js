import service from '@/utils/request'

// @Tags Gateways
// @Summary createGateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "createGateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /gateways/createGateways [post]
export const createGateways = (data) => {
  return service({
    url: '/gateways/createGateways',
    method: 'post',
    data
  })
}

// @Tags Gateways
// @Summary deleteGateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "deleteGateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /gateways/deleteGateways [delete]
export const deleteGateways = (data) => {
  return service({
    url: '/gateways/deleteGateways',
    method: 'delete',
    data
  })
}

// @Tags Gateways
// @Summary deleteGateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionGateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /gateways/deleteGateways [delete]
export const deleteGatewaysByIds = (data) => {
  return service({
    url: '/gateways/deleteGatewaysByIds',
    method: 'delete',
    data
  })
}

// @Tags Gateways
// @Summary updateGateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Gateways true "updateGateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /gateways/updateGateways [put]
export const updateGateways = (data) => {
  return service({
    url: '/gateways/updateGateways',
    method: 'put',
    data
  })
}

// @Tags Gateways
// @Summary query by idGateways
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Gateways true "query by idGateways"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /gateways/findGateways [get]
export const findGateways = (params) => {
  return service({
    url: '/gateways/findGateways',
    method: 'get',
    params
  })
}

// @Tags Gateways
// @Summary Paging acquisitionGatewayslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionGatewayslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /gateways/getGatewaysList [get]
export const getGatewaysList = (params) => {
  return service({
    url: '/gateways/getGatewaysList',
    method: 'get',
    params
  })
}
