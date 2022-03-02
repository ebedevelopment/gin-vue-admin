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

type PackagesApi struct {
}

var packagesService = service.ServiceGroupApp.AutoCodeServiceGroup.PackagesService


// CreatePackages CreatePackages
// @Tags Packages
// @Summary CreatePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Packages true "CreatePackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /packages/createPackages [post]
func (packagesApi *PackagesApi) CreatePackages(c *gin.Context) {
	var packages autocode.Packages
	_ = c.ShouldBindJSON(&packages)
	if err := packagesService.CreatePackages(packages); err != nil {
        global.GVA_LOG.Error(global.Translate("general.creationFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.creationFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.createSuccss"), c)
	}
}

// DeletePackages DeletePackages
// @Tags Packages
// @Summary DeletePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Packages true "DeletePackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"successfully deleted"}"
// @Router /packages/deletePackages [delete]
func (packagesApi *PackagesApi) DeletePackages(c *gin.Context) {
	var packages autocode.Packages
	_ = c.ShouldBindJSON(&packages)
	if err := packagesService.DeletePackages(packages); err != nil {
        global.GVA_LOG.Error(global.Translate("general.deleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.deletFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.deleteSuccess"), c)
	}
}

// DeletePackagesByIds batch deletionPackages
// @Tags Packages
// @Summary batch deletionPackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "batch deletionPackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"Batch delete successfully"}"
// @Router /packages/deletePackagesByIds [delete]
func (packagesApi *PackagesApi) DeletePackagesByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := packagesService.DeletePackagesByIds(IDS); err != nil {
        global.GVA_LOG.Error(global.Translate("sys_operation_record.batchDeleteFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("sys_operation_record.batchDeleteFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("sys_operation_record.batchDeleteSuccess"), c)
	}
}

// UpdatePackages UpdatePackages
// @Tags Packages
// @Summary UpdatePackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Packages true "UpdatePackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"update completed"}"
// @Router /packages/updatePackages [put]
func (packagesApi *PackagesApi) UpdatePackages(c *gin.Context) {
	var packages autocode.Packages
	_ = c.ShouldBindJSON(&packages)
	if err := packagesService.UpdatePackages(packages); err != nil {
        global.GVA_LOG.Error(global.Translate("general.updateFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.updateFailErr"), c)
	} else {
		response.OkWithMessage(global.Translate("general.updateSuccess"), c)
	}
}

// FindPackages query by idPackages
// @Tags Packages
// @Summary query by idPackages
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Packages true "query by idPackages"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"search successful"}"
// @Router /packages/findPackages [get]
func (packagesApi *PackagesApi) FindPackages(c *gin.Context) {
	var packages autocode.Packages
	_ = c.ShouldBindQuery(&packages)
	if err, repackages := packagesService.GetPackages(packages.ID); err != nil {
        global.GVA_LOG.Error(global.Translate("general.queryFail"), zap.Error(err))
		response.FailWithMessage(global.Translate("general.queryFailErr"), c)
	} else {
		response.OkWithData(gin.H{"repackages": repackages}, c)
	}
}

// GetPackagesList Paging acquisitionPackagesList
// @Tags Packages
// @Summary Paging acquisitionPackages List
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.PackagesSearch true "PagingPackageslist"
// @Success 200 {string} string "{"success":true,"data":{},"msg":global.Translate("general.getDataSuccess")}"
// @Router /packages/getPackagesList [get]
func (packagesApi *PackagesApi) GetPackagesList(c *gin.Context) {
	var pageInfo autocodeReq.PackagesSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := packagesService.GetPackagesInfoList(pageInfo); err != nil {
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
