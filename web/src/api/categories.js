import service from '@/utils/request'

// @Tags Categories
// @Summary createCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Categories true "createCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /categories/createCategories [post]
export const createCategories = (data) => {
  return service({
    url: '/categories/createCategories',
    method: 'post',
    data
  })
}

// @Tags Categories
// @Summary deleteCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Categories true "deleteCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /categories/deleteCategories [delete]
export const deleteCategories = (data) => {
  return service({
    url: '/categories/deleteCategories',
    method: 'delete',
    data
  })
}

// @Tags Categories
// @Summary deleteCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /categories/deleteCategories [delete]
export const deleteCategoriesByIds = (data) => {
  return service({
    url: '/categories/deleteCategoriesByIds',
    method: 'delete',
    data
  })
}

// @Tags Categories
// @Summary updateCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Categories true "updateCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /categories/updateCategories [put]
export const updateCategories = (data) => {
  return service({
    url: '/categories/updateCategories',
    method: 'put',
    data
  })
}

// @Tags Categories
// @Summary query by idCategories
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Categories true "query by idCategories"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /categories/findCategories [get]
export const findCategories = (params) => {
  return service({
    url: '/categories/findCategories',
    method: 'get',
    params
  })
}

// @Tags Categories
// @Summary Paging acquisitionCategorieslist
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "Paging acquisitionCategorieslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /categories/getCategoriesList [get]
export const getCategoriesList = (params) => {
  return service({
    url: '/categories/getCategoriesList',
    method: 'get',
    params
  })
}
