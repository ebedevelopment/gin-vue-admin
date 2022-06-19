import service from '@/utils/request'

// @Tags Services
// @Summary 创建Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "创建Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /services/createServices [post]
export const createServices = (data) => {

    return service({
        url: '/services/createServices',
        method: 'post',
        data
    })
}

export const createServiceFields = (data) => {

    return service({
        url: '/servicefields/createServiceFields',
        method: 'post',
        data
    })

}

// @Tags Services
// @Summary 删除Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "删除Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /services/deleteServices [delete]
export const deleteServices = (data) => {
    return service({
        url: '/services/deleteServices',
        method: 'delete',
        data
    })
}

// @Tags Services
// @Summary 删除Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /services/deleteServices [delete]
export const deleteServicesByIds = (data) => {
    return service({
        url: '/services/deleteServicesByIds',
        method: 'delete',
        data
    })
}

// @Tags Services
// @Summary 更新Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "更新Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /services/updateServices [put]
export const updateServices = (data) => {
    return service({
        url: '/services/updateServices',
        method: 'put',
        data
    })
}

// @Tags Services
// @Summary 用id查询Services
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Services true "用id查询Services"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /services/findServices [get]
export const findServices = (params) => {
    return service({
        url: '/services/findServices',
        method: 'get',
        params
    })
}

// @Tags Services
// @Summary 分页获取Services列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Services列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /services/getServicesList [get]
export const getServicesList = (params) => {
    return service({
        url: '/services/getServicesList',
        method: 'get',
        params
    })
}