package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type GatewaysService struct {
}

// CreateGateways 创建Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) CreateGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Create(&gateways).Error
	return err
}

// DeleteGateways 删除Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) DeleteGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Delete(&gateways).Error
	return err
}

// DeleteGatewaysByIds 批量删除Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) DeleteGatewaysByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Gateways{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateGateways 更新Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) UpdateGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Save(&gateways).Error
	return err
}

// GetGateways 根据id获取Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) GetGateways(id uint) (err error, gateways autocode.Gateways) {
	err = global.GVA_DB.Where("id = ?", id).First(&gateways).Error
	return
}

// GetGatewaysInfoList 分页获取Gateways记录
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) GetGatewaysInfoList(info autoCodeReq.GatewaysSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&autocode.Gateways{})
	var gatewayss []autocode.Gateways
	// If the conditional search Automatically creates search below statement
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&gatewayss).Error
	return err, gatewayss, total
}
