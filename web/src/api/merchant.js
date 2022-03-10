import service from '@/utils/request'

// @Tags Merchant
// @Summary createMerchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "createMerchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /merchant/createMerchant [post]
export const createMerchant = (data) => {
  return service({
    url: '/merchant/createMerchant',
    method: 'post',
    data
  })
}

// @Tags Merchant
// @Summary deleteMerchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "deleteMerchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /merchant/deleteMerchant [delete]
export const deleteMerchant = (data) => {
  return service({
    url: '/merchant/deleteMerchant',
    method: 'delete',
    data
  })
}

// @Tags Merchant
// @Summary deleteMerchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionMerchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /merchant/deleteMerchant [delete]
export const deleteMerchantByIds = (data) => {
  return service({
    url: '/merchant/deleteMerchantByIds',
    method: 'delete',
    data
  })
}

// @Tags Merchant
// @Summary updateMerchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "updateMerchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /merchant/updateMerchant [put]
export const updateMerchant = (data) => {
  return service({
    url: '/merchant/updateMerchant',
    method: 'put',
    data
  })
}

// @Tags Merchant
// @Summary query by idMerchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Merchant true "query by idMerchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /merchant/findMerchant [get]
export const findMerchant = (params) => {
  return service({
    url: '/merchant/findMerchant',
    method: 'get',
    params
  })
}

// @Tags Merchant
// @Summary Paging acquisitionMerchantlist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionMerchantlist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /merchant/getMerchantList [get]
export const getMerchantList = (params) => {
  return service({
    url: '/merchant/getMerchantList',
    method: 'get',
    params
  })
}
