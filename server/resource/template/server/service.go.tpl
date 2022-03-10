package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type {{.StructName}}Service struct {
}

// Create{{.StructName}} create{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service) Create{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Create(&{{.Abbreviation}}).Error
	return err
}

// Delete{{.StructName}} Delete{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Delete{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Delete(&{{.Abbreviation}}).Error
	return err
}

// Delete{{.StructName}}ByIds batch deletion{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Delete{{.StructName}}ByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.{{.StructName}}{},"id in ?",ids.Ids).Error
	return err
}

// Update{{.StructName}} update{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Update{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Save(&{{.Abbreviation}}).Error
	return err
}

// Get{{.StructName}} Get by id{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Get{{.StructName}}(id uint) (err error, {{.Abbreviation}} autocode.{{.StructName}}) {
	err = global.GVA_DB.Where("id = ?", id).First(&{{.Abbreviation}}).Error
	return
}

// Get{{.StructName}}InfoList Paging acquisition{{.StructName}}Record
// Author [piexlmax](https://github.com/piexlmax)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Get{{.StructName}}InfoList(info autoCodeReq.{{.StructName}}Search) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // create db
	db := global.GVA_DB.Model(&autocode.{{.StructName}}{})
    var {{.Abbreviation}}s []autocode.{{.StructName}}
    // If there is a conditional search, the search statement will be automatically created below
        {{- range .Fields}}
            {{- if .FieldSearchType}}
                {{- if eq .FieldType "string" }}
    if info.{{.FieldName}} != "" {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
                {{- else if eq .FieldType "bool" }}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
                {{- else if eq .FieldType "int" }}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
                {{- else if eq .FieldType "float64" }}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
                {{- else if eq .FieldType "time.Time" }}
    if info.{{.FieldName}} != nil {
         db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
                {{- end }}
        {{- end }}
    {{- end }}
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&{{.Abbreviation}}s).Error
	return err, {{.Abbreviation}}s, total
}
