import service from '@/utils/request'

// @Tags Frontends
// @Summary createFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Frontends true "createFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/createFrontends [post]
export const createFrontends = (data) => {
  return service({
    url: '/frontends/createFrontends',
    method: 'post',
    data
  })
}

// @Tags Frontends
// @Summary deleteFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Frontends true "deleteFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /frontends/deleteFrontends [delete]
export const deleteFrontends = (data) => {
  return service({
    url: '/frontends/deleteFrontends',
    method: 'delete',
    data
  })
}

// @Tags Frontends
// @Summary deleteFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /frontends/deleteFrontends [delete]
export const deleteFrontendsByIds = (data) => {
  return service({
    url: '/frontends/deleteFrontendsByIds',
    method: 'delete',
    data
  })
}

// @Tags Frontends
// @Summary updateFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Frontends true "updateFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /frontends/updateFrontends [put]
export const updateFrontends = (data) => {
  return service({
    url: '/frontends/updateFrontends',
    method: 'put',
    data
  })
}

// @Tags Frontends
// @Summary query by idFrontends
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Frontends true "query by idFrontends"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /frontends/findFrontends [get]
export const findFrontends = (params) => {
  return service({
    url: '/frontends/findFrontends',
    method: 'get',
    params
  })
}

// @Tags Frontends
// @Summary Paging acquisitionFrontendslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionFrontendslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /frontends/getFrontendsList [get]
export const getFrontendsList = (params) => {
  return service({
    url: '/frontends/getFrontendsList',
    method: 'get',
    params
  })
}
