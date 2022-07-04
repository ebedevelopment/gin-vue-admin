import service from '@/utils/request'

// @Tags Fields
// @Summary 创建Fields
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Fields true "创建Fields"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /servicefields/createServiceFields [post]
export const createServiceFields = (data) => {

    return service({
        url: '/servicefields/createServiceFields',
        method: 'post',
        data
    })

}

export const updateServiceFields = (data) => {

    return service({
        url: '/servicefields/updateServiceFields',
        method: 'put',
        data
    })

}

export const deleteServiceFields = (data) => {

    return service({
        url: '/servicefields/deleteServiceFields',
        method: 'delete',
        data
    })

}