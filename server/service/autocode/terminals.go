package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type TerminalsService struct {
}

// CreateTerminals 创建Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService) CreateTerminals(terminals autocode.Terminals) (err error) {
	err = global.GVA_DB.Create(&terminals).Error
	return err
}

// DeleteTerminals 删除Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService)DeleteTerminals(terminals autocode.Terminals) (err error) {
	err = global.GVA_DB.Delete(&terminals).Error
	return err
}

// DeleteTerminalsByIds 批量删除Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService)DeleteTerminalsByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Terminals{},"id in ?",ids.Ids).Error
	return err
}

// UpdateTerminals 更新Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService)UpdateTerminals(terminals autocode.Terminals) (err error) {
	err = global.GVA_DB.Save(&terminals).Error
	return err
}

// GetTerminals 根据id获取Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService)GetTerminals(id uint) (err error, terminals autocode.Terminals) {
	err = global.GVA_DB.Where("id = ?", id).First(&terminals).Error
	return
}

// GetTerminalsInfoList 分页获取Terminals记录
// Author [piexlmax](https://github.com/piexlmax)
func (terminalsService *TerminalsService)GetTerminalsInfoList(info autoCodeReq.TerminalsSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.Terminals{})
    var terminalss []autocode.Terminals
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&terminalss).Error
	return err, terminalss, total
}
