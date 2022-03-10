package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type TerminalService struct {
}

// CreateTerminal createTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService) CreateTerminal(terminal autocode.Terminal) (err error) {
	err = global.GVA_DB.Create(&terminal).Error
	return err
}

// DeleteTerminal DeleteTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService)DeleteTerminal(terminal autocode.Terminal) (err error) {
	err = global.GVA_DB.Delete(&terminal).Error
	return err
}

// DeleteTerminalByIds batch deletionTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService)DeleteTerminalByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Terminal{},"id in ?",ids.Ids).Error
	return err
}

// UpdateTerminal updateTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService)UpdateTerminal(terminal autocode.Terminal) (err error) {
	err = global.GVA_DB.Save(&terminal).Error
	return err
}

// GetTerminal Get by idTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService)GetTerminal(id uint) (err error, terminal autocode.Terminal) {
	err = global.GVA_DB.Where("id = ?", id).First(&terminal).Error
	return
}

// GetTerminalInfoList Paging acquisitionTerminalRecord
// Author [piexlmax](https://github.com/piexlmax)
func (terminalService *TerminalService)GetTerminalInfoList(info autoCodeReq.TerminalSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.Terminal{})
    var terminals []autocode.Terminal
    // If there is a conditional search, the search statement will be automatically created below
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&terminals).Error
	return err, terminals, total
}
