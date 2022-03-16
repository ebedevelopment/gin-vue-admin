import service from '@/utils/request'

// @Tags Providers
// @Summary 创建Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "创建Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /providers/createProviders [post]
export const createProviders = (data) => {
  return service({
    url: '/providers/createProviders',
    method: 'post',
    data
  })
}

// @Tags Providers
// @Summary 删除Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "删除Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /providers/deleteProviders [delete]
export const deleteProviders = (data) => {
  return service({
    url: '/providers/deleteProviders',
    method: 'delete',
    data
  })
}

// @Tags Providers
// @Summary 删除Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /providers/deleteProviders [delete]
export const deleteProvidersByIds = (data) => {
  return service({
    url: '/providers/deleteProvidersByIds',
    method: 'delete',
    data
  })
}

// @Tags Providers
// @Summary 更新Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Providers true "更新Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /providers/updateProviders [put]
export const updateProviders = (data) => {
  return service({
    url: '/providers/updateProviders',
    method: 'put',
    data
  })
}

// @Tags Providers
// @Summary 用id查询Providers
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Providers true "用id查询Providers"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /providers/findProviders [get]
export const findProviders = (params) => {
  return service({
    url: '/providers/findProviders',
    method: 'get',
    params
  })
}

// @Tags Providers
// @Summary 分页获取Providers列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Providers列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /providers/getProvidersList [get]
export const getProvidersList = (params) => {
  return service({
    url: '/providers/getProvidersList',
    method: 'get',
    params
  })
}
