import service from '@/utils/request'

// @Tags UserLogin
// @Summary 创建UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.UserLogin true "创建UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /userLogin/createUserLogin [post]
export const createUserLogin = (data) => {
  return service({
    url: '/userLogin/createUserLogin',
    method: 'post',
    data
  })
}

// @Tags UserLogin
// @Summary 删除UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.UserLogin true "删除UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /userLogin/deleteUserLogin [delete]
export const deleteUserLogin = (data) => {
  return service({
    url: '/userLogin/deleteUserLogin',
    method: 'delete',
    data
  })
}

// @Tags UserLogin
// @Summary 删除UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /userLogin/deleteUserLogin [delete]
export const deleteUserLoginByIds = (data) => {
  return service({
    url: '/userLogin/deleteUserLoginByIds',
    method: 'delete',
    data
  })
}

// @Tags UserLogin
// @Summary 更新UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.UserLogin true "更新UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /userLogin/updateUserLogin [put]
export const updateUserLogin = (data) => {
  return service({
    url: '/userLogin/updateUserLogin',
    method: 'put',
    data
  })
}

// @Tags UserLogin
// @Summary 用id查询UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.UserLogin true "用id查询UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /userLogin/findUserLogin [get]
export const findUserLogin = (params) => {
  return service({
    url: '/userLogin/findUserLogin',
    method: 'get',
    params
  })
}

// @Tags UserLogin
// @Summary 分页获取UserLogin列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取UserLogin列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /userLogin/getUserLoginList [get]
export const getUserLoginList = (params) => {
  return service({
    url: '/userLogin/getUserLoginList',
    method: 'get',
    params
  })
}
