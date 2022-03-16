package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
)

type UserLoginApi struct {
}

var userLoginService = service.ServiceGroupApp.AutoCodeServiceGroup.UserLoginService


// CreateUserLogin 创建UserLogin
// @Tags UserLogin
// @Summary 创建UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.UserLogin true "创建UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /userLogin/createUserLogin [post]
func (userLoginApi *UserLoginApi) CreateUserLogin(c *gin.Context) {
	var userLogin autocode.UserLogin
	_ = c.ShouldBindJSON(&userLogin)
	if err := userLoginService.CreateUserLogin(userLogin); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeleteUserLogin 删除UserLogin
// @Tags UserLogin
// @Summary 删除UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.UserLogin true "删除UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /userLogin/deleteUserLogin [delete]
func (userLoginApi *UserLoginApi) DeleteUserLogin(c *gin.Context) {
	var userLogin autocode.UserLogin
	_ = c.ShouldBindJSON(&userLogin)
	if err := userLoginService.DeleteUserLogin(userLogin); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeleteUserLoginByIds 批量删除UserLogin
// @Tags UserLogin
// @Summary 批量删除UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /userLogin/deleteUserLoginByIds [delete]
func (userLoginApi *UserLoginApi) DeleteUserLoginByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := userLoginService.DeleteUserLoginByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdateUserLogin 更新UserLogin
// @Tags UserLogin
// @Summary 更新UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.UserLogin true "更新UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /userLogin/updateUserLogin [put]
func (userLoginApi *UserLoginApi) UpdateUserLogin(c *gin.Context) {
	var userLogin autocode.UserLogin
	_ = c.ShouldBindJSON(&userLogin)
	if err := userLoginService.UpdateUserLogin(userLogin); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindUserLogin 用id查询UserLogin
// @Tags UserLogin
// @Summary 用id查询UserLogin
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.UserLogin true "用id查询UserLogin"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /userLogin/findUserLogin [get]
func (userLoginApi *UserLoginApi) FindUserLogin(c *gin.Context) {
	var userLogin autocode.UserLogin
	_ = c.ShouldBindQuery(&userLogin)
	if err, reuserLogin := userLoginService.GetUserLogin(userLogin.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"reuserLogin": reuserLogin}, c)
	}
}

// GetUserLoginList 分页获取UserLogin列表
// @Tags UserLogin
// @Summary 分页获取UserLogin列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.UserLoginSearch true "分页获取UserLogin列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /userLogin/getUserLoginList [get]
func (userLoginApi *UserLoginApi) GetUserLoginList(c *gin.Context) {
	var pageInfo autocodeReq.UserLoginSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := userLoginService.GetUserLoginInfoList(pageInfo); err != nil {
	    global.GVA_LOG.Error(global.Translate("general.getDataFail"), zap.Error(err))
        response.FailWithMessage(global.Translate("general.getDataFailErr"), c)
    } else {
        response.OkWithDetailed(response.PageResult{
            List:     list,
            Total:    total,
            Page:     pageInfo.Page,
            PageSize: pageInfo.PageSize,
        }, global.Translate("general.getDataSuccess"), c)
    }
}
