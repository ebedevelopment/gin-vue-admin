// 自动生成模板Services
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Services 结构体
// 如果含有time.Time 请自行import time包
type Services struct {
	global.GVA_MODEL
	CatId            *int       `json:"catId" form:"catId" gorm:"column:cat_id;comment:;size:19;"`
	ProvId           *int       `json:"provId" form:"provId" gorm:"column:prov_id;comment:;size:19;"`
	NameAr           string     `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
	NameEn           string     `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
	IsPrice          *int       `json:"isPrice" form:"isPrice" gorm:"column:is_price;comment:;size:10;"`
	Price            *float64   `json:"price" form:"price" gorm:"column:price;comment:;"`
	Inq              *int       `json:"inq" form:"inq" gorm:"column:inq;comment:;size:10;"`
	Count            *int       `json:"count" form:"count" gorm:"column:count;comment:;size:19;"`
	IsPar            *int       `json:"isPar" form:"isPar" gorm:"column:is_par;comment:;size:19;"`
	DefaultGatewayDn string     `json:"defaultGatewayDn" form:"defaultGatewayDn" gorm:"column:default_gateway_dn;comment:;size:255;"`
	Status           *bool      `json:"status" form:"status" gorm:"column:status;"`
	GatewayValues    []int      `json:"gateways" form:"gateways" gorm:"-"`
	Gateways         []Gateways `gorm:"many2many:service_gateways;ForeignKey:id;References:id"`

	FieldsValues []int    `json:"fields" form:"fields" gorm:"-"`
	Fields       []Fields `gorm:"many2many:service_fields;ForeignKey:id;References:id"`

	VersionValues []int      `json:"softwareVersion" form:"softwareVersion" gorm:"-"`
	Versions      []Versions `gorm:"many2many:service_versions;ForeignKey:id;References:id"`
	FileUrl       string     `json:"fileUrl" gorm:"-"`
}
type ServiceList struct {
	global.GVA_MODEL
	CategoryId     string   `json:"categoryId" form:"categoryId"`
	Count          *int     `json:"count" form:"count"`
	DefaultGateway string   `json:"defaultGatewayDn" form:"defaultGatewayDn"`
	Inquirable     *int     `json:"inquirable" form:"inquirable"`
	IsPar          *int     `json:"isPar" form:"isPar"`
	IsPrice        *int     `json:"isPrice" form:"isPrice"`
	NameAr         string   `json:"nameAr" form:"nameAr"`
	NameEn         string   `json:"nameEn" form:"nameEn"`
	Price          *float64 `json:"price" form:"price"`
	ProviderId     string   `json:"providerId" form:"providerId"`

	// GatewayValues []string `json:"gateways" form:"gateways"`

	// FieldsValues []string `json:"fields" form:"fields"`

	// FrontendValues []string `json:"frontend" form:"frontend"`
}

type ServiceRequest struct {
	ServiceId uint `json:"id"`

	Gateways []struct {
		DNS  string `json:"dns"`
		Cols struct {
			BillerID         int    `json:"biller_id"`
			BillingAccountID int    `json:"billing_account_id"`
			Type             string `json:"type"`
			Code             string `json:"code"`
			CardDataID       int    `json:"card_data_id"`
			EPayBillRecID    int    `json:"e_pay_bill_rec_id"`
			SequenceID       int    `json:"sequence_id"`
			AmountID         int    `json:"amount_id"`
			FeesAmtID        int    `json:"fees_amt_id"`
			CurCodeID        int    `json:"cur_code_id"`
			BillNumID        int    `json:"bill_num_id"`
			PmtRefInfoID     int    `json:"pmt_ref_info_id"`
		} `json:"cols"`
	} `json:"gateways"`
}

// TableName Services The name of the table
func (Services) TableName() string {
	return "services"
}
