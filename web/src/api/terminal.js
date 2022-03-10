import service from '@/utils/request'

// @Tags Terminal
// @Summary createTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminal true "createTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminal/createTerminal [post]
export const createTerminal = (data) => {
  return service({
    url: '/terminal/createTerminal',
    method: 'post',
    data
  })
}

// @Tags Terminal
// @Summary deleteTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminal true "deleteTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /terminal/deleteTerminal [delete]
export const deleteTerminal = (data) => {
  return service({
    url: '/terminal/deleteTerminal',
    method: 'delete',
    data
  })
}

// @Tags Terminal
// @Summary deleteTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /terminal/deleteTerminal [delete]
export const deleteTerminalByIds = (data) => {
  return service({
    url: '/terminal/deleteTerminalByIds',
    method: 'delete',
    data
  })
}

// @Tags Terminal
// @Summary updateTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Terminal true "updateTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /terminal/updateTerminal [put]
export const updateTerminal = (data) => {
  return service({
    url: '/terminal/updateTerminal',
    method: 'put',
    data
  })
}

// @Tags Terminal
// @Summary query by idTerminal
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Terminal true "query by idTerminal"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /terminal/findTerminal [get]
export const findTerminal = (params) => {
  return service({
    url: '/terminal/findTerminal',
    method: 'get',
    params
  })
}

// @Tags Terminal
// @Summary Paging acquisitionTerminallist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionTerminallist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /terminal/getTerminalList [get]
export const getTerminalList = (params) => {
  return service({
    url: '/terminal/getTerminalList',
    method: 'get',
    params
  })
}
