package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type GatewaysService struct {
}

// CreateGateways createGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService) CreateGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Create(&gateways).Error
	return err
}

// DeleteGateways DeleteGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService)DeleteGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Delete(&gateways).Error
	return err
}

// DeleteGatewaysByIds batch deletionGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService)DeleteGatewaysByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Gateways{},"id in ?",ids.Ids).Error
	return err
}

// UpdateGateways updateGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService)UpdateGateways(gateways autocode.Gateways) (err error) {
	err = global.GVA_DB.Save(&gateways).Error
	return err
}

// GetGateways Get by idGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService)GetGateways(id uint) (err error, gateways autocode.Gateways) {
	err = global.GVA_DB.Where("id = ?", id).First(&gateways).Error
	return
}

// GetGatewaysInfoList Paging acquisitionGatewaysRecord
// Author [piexlmax](https://github.com/piexlmax)
func (gatewaysService *GatewaysService)GetGatewaysInfoList(info autoCodeReq.GatewaysSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Gateways{})
    var gatewayss []autocode.Gateways
    // If there is a conditional search, the search statement will be automatically created below
    if info.DomainNameService != "" {
        db = db.Where("domain_name_service LIKE ?","%"+ info.DomainNameService+"%")
    }
    if info.NameAr != "" {
        db = db.Where("name_ar LIKE ?","%"+ info.NameAr+"%")
    }
    if info.NameEn != "" {
        db = db.Where("name_en LIKE ?","%"+ info.NameEn+"%")
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&gatewayss).Error
	return err, gatewayss, total
}
