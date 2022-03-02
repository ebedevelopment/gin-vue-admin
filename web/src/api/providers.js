import service from '@/utils/request'

// @Tags Providers
// @Summary createProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "createProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /providers/createProviders [post]
export const createProviders = (data) => {
  return service({
    url: '/providers/createProviders',
    method: 'post',
    data
  })
}

// @Tags Providers
// @Summary deleteProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "deleteProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /providers/deleteProviders [delete]
export const deleteProviders = (data) => {
  return service({
    url: '/providers/deleteProviders',
    method: 'delete',
    data
  })
}

// @Tags Providers
// @Summary deleteProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /providers/deleteProviders [delete]
export const deleteProvidersByIds = (data) => {
  return service({
    url: '/providers/deleteProvidersByIds',
    method: 'delete',
    data
  })
}

// @Tags Providers
// @Summary updateProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "updateProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /providers/updateProviders [put]
export const updateProviders = (data) => {
  return service({
    url: '/providers/updateProviders',
    method: 'put',
    data
  })
}

// @Tags Providers
// @Summary query by idProviders
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Providers true "query by idProviders"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /providers/findProviders [get]
export const findProviders = (params) => {
  return service({
    url: '/providers/findProviders',
    method: 'get',
    params
  })
}

// @Tags Providers
// @Summary Paging acquisitionProviderslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionProviderslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /providers/getProvidersList [get]
export const getProvidersList = (params) => {
  return service({
    url: '/providers/getProvidersList',
    method: 'get',
    params
  })
}
