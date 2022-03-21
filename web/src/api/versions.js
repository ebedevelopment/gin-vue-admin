import service from '@/utils/request'

// @Tags Versions
// @Summary 创建Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "创建Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /frontends/createVersions [post]
export const createVersions = (data) => {
  return service({
    url: '/frontends/createVersions',
    method: 'post',
    data
  })
}

// @Tags Versions
// @Summary 删除Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "删除Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /frontends/deleteVersions [delete]
export const deleteVersions = (data) => {
  return service({
    url: '/frontends/deleteVersions',
    method: 'delete',
    data
  })
}

// @Tags Versions
// @Summary 删除Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /frontends/deleteVersions [delete]
export const deleteVersionsByIds = (data) => {
  return service({
    url: '/frontends/deleteVersionsByIds',
    method: 'delete',
    data
  })
}

// @Tags Versions
// @Summary 更新Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Versions true "更新Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /frontends/updateVersions [put]
export const updateVersions = (data) => {
  return service({
    url: '/frontends/updateVersions',
    method: 'put',
    data
  })
}

// @Tags Versions
// @Summary 用id查询Versions
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Versions true "用id查询Versions"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /frontends/findVersions [get]
export const findVersions = (params) => {
  return service({
    url: '/frontends/findVersions',
    method: 'get',
    params
  })
}

// @Tags Versions
// @Summary 分页获取Versions列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Versions列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /frontends/getVersionsList [get]
export const getVersionsList = (params) => {
  return service({
    url: '/frontends/getVersionsList',
    method: 'get',
    params
  })
}
