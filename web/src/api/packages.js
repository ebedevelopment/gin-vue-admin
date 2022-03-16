import service from '@/utils/request'

// @Tags Packages
// @Summary 创建Packages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "创建Packages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /packages/createPackages [post]
export const createPackages = (data) => {
  return service({
    url: '/packages/createPackages',
    method: 'post',
    data
  })
}

// @Tags Packages
// @Summary 删除Packages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "删除Packages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /packages/deletePackages [delete]
export const deletePackages = (data) => {
  return service({
    url: '/packages/deletePackages',
    method: 'delete',
    data
  })
}

// @Tags Packages
// @Summary 删除Packages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Packages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /packages/deletePackages [delete]
export const deletePackagesByIds = (data) => {
  return service({
    url: '/packages/deletePackagesByIds',
    method: 'delete',
    data
  })
}

// @Tags Packages
// @Summary 更新Packages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Packages true "更新Packages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /packages/updatePackages [put]
export const updatePackages = (data) => {
  return service({
    url: '/packages/updatePackages',
    method: 'put',
    data
  })
}

// @Tags Packages
// @Summary 用id查询Packages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Packages true "用id查询Packages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /packages/findPackages [get]
export const findPackages = (params) => {
  return service({
    url: '/packages/findPackages',
    method: 'get',
    params
  })
}

// @Tags Packages
// @Summary 分页获取Packages列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Packages列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /packages/getPackagesList [get]
export const getPackagesList = (params) => {
  return service({
    url: '/packages/getPackagesList',
    method: 'get',
    params
  })
}
