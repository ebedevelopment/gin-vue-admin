// Automatically generate templatesServices
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Services structure
//If it contains time.Time, please import the time package by yourself
type Services struct {
	global.GVA_MODEL
	CategoryId     *int     `json:"categoryId" form:"categoryId" gorm:"column:category_id;comment:;size:10;"`
	Count          *int     `json:"count" form:"count" gorm:"column:count;comment:;size:19;"`
	DefaultGateway string   `json:"defaultGateway" form:"defaultGateway" gorm:"column:default_gateway;comment:;size:255;"`
	Inquirable     *int     `json:"inquirable" form:"inquirable" gorm:"column:inquirable;comment:;size:19;"`
	IsPar          *int     `json:"isPar" form:"isPar" gorm:"column:is_par;comment:;size:19;"`
	IsPrice        *bool    `json:"isPrice" form:"isPrice" gorm:"column:is_price;comment:;"`
	NameAr         string   `json:"nameAr" form:"nameAr" gorm:"column:name_ar;comment:;size:255;"`
	NameEn         string   `json:"nameEn" form:"nameEn" gorm:"column:name_en;comment:;size:255;"`
	Price          *float64 `json:"price" form:"price" gorm:"column:price;comment:;size:22;"`
	ProviderId     *int     `json:"providerId" form:"providerId" gorm:"column:provider_id;comment:;size:10;"`

	GatewayValues []int      `json:"gateways" form:"gateways" gorm:"-"`
	Gateways      []Gateways `gorm:"many2many:service_gateway;ForeignKey:id;References:id"`

	FieldsValues []int    `json:"fields" form:"fields" gorm:"-"`
	Fields       []Fields `gorm:"many2many:service_field;ForeignKey:id;References:id"`
	FileUrl      string   `json:"fileUrl" gorm:"-"`
}

// ServiceRequest for add/update service
// type ServiceRequest struct {
// 	ServiceId uint        `json:"id"`
// 	Gateways  []FileGateways `json:"gateways"`
// }

type ServiceRequest struct {
	ServiceId uint        `json:"id"`

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

type FileGateways struct {
	DNS  string      `json:"dns"`
	Cols interface{} `json:"cols"`
}

// TableName Services Table Name
func (Services) TableName() string {
	return "services"
}

type ServiceList struct {
	global.GVA_MODEL
	CategoryId     string   `json:"categoryId" form:"categoryId"`
	Count          *int     `json:"count" form:"count"`
	DefaultGateway string   `json:"defaultGateway" form:"defaultGateway"`
	Inquirable     *int     `json:"inquirable" form:"inquirable"`
	IsPar          *int     `json:"isPar" form:"isPar"`
	IsPrice        *bool    `json:"isPrice" form:"isPrice"`
	NameAr         string   `json:"nameAr" form:"nameAr"`
	NameEn         string   `json:"nameEn" form:"nameEn"`
	Price          *float64 `json:"price" form:"price"`
	ProviderId     string   `json:"providerId" form:"providerId"`

	// GatewayValues []string `json:"gateways" form:"gateways"`

	// FieldsValues []string `json:"fields" form:"fields"`

	// FrontendValues []string `json:"frontend" form:"frontend"`
}
