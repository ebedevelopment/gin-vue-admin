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
type ServiceFields struct {
	Gateway string `json:"gateway" form:"gateway"`
	Fields  []struct {
		Fid          int    `json:"fid"`
		MatchingName string `json:"matchingName"`
	} `json:"fields"`
}
