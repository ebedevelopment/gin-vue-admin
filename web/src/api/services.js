import service from '@/utils/request'

// @Tags Services
// @Summary createServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "createServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/createServices [post]
export const createServices = (data) => {
    console.log("Dataaaaaa:   ", data)
    return service({
        url: '/services/createServices',
        method: 'post',
        data
    })
}

// @Tags Services
// @Summary deleteServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "deleteServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /services/deleteServices [delete]
export const deleteServices = (data) => {
    return service({
        url: '/services/deleteServices',
        method: 'delete',
        data
    })
}

// @Tags Services
// @Summary deleteServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /services/deleteServices [delete]
export const deleteServicesByIds = (data) => {
    return service({
        url: '/services/deleteServicesByIds',
        method: 'delete',
        data
    })
}

// @Tags Services
// @Summary updateServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Services true "updateServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /services/updateServices [put]
export const updateServices = (data) => {
    return service({
        url: '/services/updateServices',
        method: 'put',
        data
    })
}

// @Tags Services
// @Summary query by idServices
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Services true "query by idServices"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /services/findServices [get]
export const findServices = (params) => {
    return service({
        url: '/services/findServices',
        method: 'get',
        params
    })
}

// @Tags Services
// @Summary Paging acquisitionServiceslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionServiceslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /services/getServicesList [get]
export const getServicesList = (params) => {
    return service({
        url: '/services/getServicesList',
        method: 'get',
        params
    })
}
export const uploadservicefile = (data) => {
    return service({
        url: '/services/upload',
        method: 'post',
        data
    })
}