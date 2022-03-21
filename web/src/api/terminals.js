import service from '@/utils/request'

// @Tags Terminals
// @Summary 创建Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminals true "创建Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /terminals/createTerminals [post]
export const createTerminals = (data) => {
  return service({
    url: '/terminals/createTerminals',
    method: 'post',
    data
  })
}

// @Tags Terminals
// @Summary 删除Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminals true "删除Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /terminals/deleteTerminals [delete]
export const deleteTerminals = (data) => {
  return service({
    url: '/terminals/deleteTerminals',
    method: 'delete',
    data
  })
}

// @Tags Terminals
// @Summary 删除Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /terminals/deleteTerminals [delete]
export const deleteTerminalsByIds = (data) => {
  return service({
    url: '/terminals/deleteTerminalsByIds',
    method: 'delete',
    data
  })
}

// @Tags Terminals
// @Summary 更新Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminals true "更新Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /terminals/updateTerminals [put]
export const updateTerminals = (data) => {
  return service({
    url: '/terminals/updateTerminals',
    method: 'put',
    data
  })
}

// @Tags Terminals
// @Summary 用id查询Terminals
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Terminals true "用id查询Terminals"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /terminals/findTerminals [get]
export const findTerminals = (params) => {
  return service({
    url: '/terminals/findTerminals',
    method: 'get',
    params
  })
}

// @Tags Terminals
// @Summary 分页获取Terminals列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Terminals列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /terminals/getTerminalsList [get]
export const getTerminalsList = (params) => {
  return service({
    url: '/terminals/getTerminalsList',
    method: 'get',
    params
  })
}
