import service from '@/utils/request'

// @Tags Packages
// @Summary createPackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "createPackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /packages/createPackages [post]
export const createPackages = (data) => {
  return service({
    url: '/packages/createPackages',
    method: 'post',
    data
  })
}

// @Tags Packages
// @Summary deletePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "deletePackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /packages/deletePackages [delete]
export const deletePackages = (data) => {
  return service({
    url: '/packages/deletePackages',
    method: 'delete',
    data
  })
}

// @Tags Packages
// @Summary deletePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionPackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /packages/deletePackages [delete]
export const deletePackagesByIds = (data) => {
  return service({
    url: '/packages/deletePackagesByIds',
    method: 'delete',
    data
  })
}

// @Tags Packages
// @Summary updatePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "updatePackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /packages/updatePackages [put]
export const updatePackages = (data) => {
  return service({
    url: '/packages/updatePackages',
    method: 'put',
    data
  })
}

// @Tags Packages
// @Summary query by idPackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Packages true "query by idPackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /packages/findPackages [get]
export const findPackages = (params) => {
  return service({
    url: '/packages/findPackages',
    method: 'get',
    params
  })
}

// @Tags Packages
// @Summary Paging acquisitionPackageslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionPackageslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /packages/getPackagesList [get]
export const getPackagesList = (params) => {
  return service({
    url: '/packages/getPackagesList',
    method: 'get',
    params
  })
}
