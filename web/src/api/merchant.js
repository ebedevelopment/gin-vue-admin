import service from '@/utils/request'

// @Tags Merchant
// @Summary 创建Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "创建Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /merchant/createMerchant [post]
export const createMerchant = (data) => {
  return service({
    url: '/merchant/createMerchant',
    method: 'post',
    data
  })
}

// @Tags Merchant
// @Summary 删除Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "删除Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchant/deleteMerchant [delete]
export const deleteMerchant = (data) => {
  return service({
    url: '/merchant/deleteMerchant',
    method: 'delete',
    data
  })
}

// @Tags Merchant
// @Summary 删除Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /merchant/deleteMerchant [delete]
export const deleteMerchantByIds = (data) => {
  return service({
    url: '/merchant/deleteMerchantByIds',
    method: 'delete',
    data
  })
}

// @Tags Merchant
// @Summary 更新Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Merchant true "更新Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /merchant/updateMerchant [put]
export const updateMerchant = (data) => {
  return service({
    url: '/merchant/updateMerchant',
    method: 'put',
    data
  })
}

// @Tags Merchant
// @Summary 用id查询Merchant
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Merchant true "用id查询Merchant"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /merchant/findMerchant [get]
export const findMerchant = (params) => {
  return service({
    url: '/merchant/findMerchant',
    method: 'get',
    params
  })
}

// @Tags Merchant
// @Summary 分页获取Merchant列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Merchant列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /merchant/getMerchantList [get]
export const getMerchantList = (params) => {
  return service({
    url: '/merchant/getMerchantList',
    method: 'get',
    params
  })
}
