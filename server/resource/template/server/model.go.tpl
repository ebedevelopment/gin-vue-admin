// Automatically generate templates{{.StructName}}
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// {{.StructName}} structure
//If it contains time.Time, please import the time package by yourself
type {{.StructName}} struct {
      global.GVA_MODEL {{- range .Fields}}
            {{- if ne .FieldType "string" }}
      {{.FieldName}}  *{{.FieldType}} `json:"{{.FieldJson}}" form:"{{.FieldJson}}" gorm:"column:{{.ColumnName}};comment:{{.Comment}};{{- if .DataTypeLong -}}size:{{.DataTypeLong}};{{- end -}}"`
            {{- else }}
      {{.FieldName}}  {{.FieldType}} `json:"{{.FieldJson}}" form:"{{.FieldJson}}" gorm:"column:{{.ColumnName}};comment:{{.Comment}};{{- if .DataTypeLong -}}size:{{.DataTypeLong}};{{- end -}}"`
            {{- end }} {{- end }}
}

{{ if .TableName }}
// TableName {{.StructName}} Table Name
func ({{.StructName}}) TableName() string {
  return "{{.TableName}}"
}
{{ end }}
