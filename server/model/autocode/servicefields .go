// 自动生成模板Fields
package autocode

// "github.com/flipped-aurora/gin-vue-admin/server/global"

// Fields 结构体
// 如果含有time.Time 请自行import time包
// type ServiceFields struct {
// 	Gateway string `json:"defaultGatewayDn" form:"defaultGatewayDn"`

// 	Fields []ServiceFieldRequest `json:"fields"`
// }
// type ServiceFieldRequest struct {
// 	FieldName    string `json:"fid"`
// 	MatchingName string `json:"matchingName"`
// }

// TableName Fields 表名
// func (Fields) TableName() string {
// 	return "fields"
// }
// request of add/edit
type ServiceFields struct {
	Gateway string     `json:"gateway" form:"gateway"`
	Fields  []FieldMap `json:"fields"`
}
type FieldMap struct {
	Fid          int    `json:"fid"`
	MatchingName string `json:"matchingName"`
}

// request of get fields using dns
type GetFieldsApi struct {
	Dns string `json:"dns" form:"dns"`
}
