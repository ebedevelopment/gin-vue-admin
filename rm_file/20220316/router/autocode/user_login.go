package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type UserLoginRouter struct {
}

// InitUserLoginRouter 初始化 UserLogin 路由信息
func (s *UserLoginRouter) InitUserLoginRouter(Router *gin.RouterGroup) {
	userLoginRouter := Router.Group("userLogin").Use(middleware.OperationRecord())
	userLoginRouterWithoutRecord := Router.Group("userLogin")
	var userLoginApi = v1.ApiGroupApp.AutoCodeApiGroup.UserLoginApi
	{
		userLoginRouter.POST("createUserLogin", userLoginApi.CreateUserLogin)   // 新建UserLogin
		userLoginRouter.DELETE("deleteUserLogin", userLoginApi.DeleteUserLogin) // 删除UserLogin
		userLoginRouter.DELETE("deleteUserLoginByIds", userLoginApi.DeleteUserLoginByIds) // 批量删除UserLogin
		userLoginRouter.PUT("updateUserLogin", userLoginApi.UpdateUserLogin)    // 更新UserLogin
	}
	{
		userLoginRouterWithoutRecord.GET("findUserLogin", userLoginApi.FindUserLogin)        // 根据ID获取UserLogin
		userLoginRouterWithoutRecord.GET("getUserLoginList", userLoginApi.GetUserLoginList)  // 获取UserLogin列表
	}
}
