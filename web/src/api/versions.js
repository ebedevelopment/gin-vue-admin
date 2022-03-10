import service from '@/utils/request'

// @Tags Versions
// @Summary createVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "createVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /versions/createVersions [post]
export const createVersions = (data) => {
  return service({
    url: '/versions/createVersions',
    method: 'post',
    data
  })
}

// @Tags Versions
// @Summary deleteVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "deleteVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /versions/deleteVersions [delete]
export const deleteVersions = (data) => {
  return service({
    url: '/versions/deleteVersions',
    method: 'delete',
    data
  })
}

// @Tags Versions
// @Summary deleteVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /versions/deleteVersions [delete]
export const deleteVersionsByIds = (data) => {
  return service({
    url: '/versions/deleteVersionsByIds',
    method: 'delete',
    data
  })
}

// @Tags Versions
// @Summary updateVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "updateVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /versions/updateVersions [put]
export const updateVersions = (data) => {
  return service({
    url: '/versions/updateVersions',
    method: 'put',
    data
  })
}

// @Tags Versions
// @Summary query by idVersions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Versions true "query by idVersions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /versions/findVersions [get]
export const findVersions = (params) => {
  return service({
    url: '/versions/findVersions',
    method: 'get',
    params
  })
}

// @Tags Versions
// @Summary Paging acquisitionVersionslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionVersionslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /versions/getVersionsList [get]
export const getVersionsList = (params) => {
  return service({
    url: '/versions/getVersionsList',
    method: 'get',
    params
  })
}
