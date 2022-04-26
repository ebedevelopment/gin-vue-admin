package global

import (
	"time"

	"gorm.io/gorm"
)

type GVA_MODEL struct {
	ID        uint           `gorm:"primarykey"` // 主键ID
	CreatedAt time.Time      // creation time
	UpdatedAt time.Time      // update time
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // remove time
}
