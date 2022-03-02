<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
           {{- range .Fields}}  {{- if .FieldSearchType}} {{- if eq .FieldType "bool" }}
            <el-form-item label="{{.FieldDesc}}" prop="{{.FieldJson}}">
            <el-select v-model="searchInfo.{{.FieldJson}}" clearable :placeholder="t('general.pleaseSelect')">
                <el-option
                    key="true"
                    label="t('general.yes')"
                    value="true">
                </el-option>
                <el-option
                    key="false"
                    label="t('general.no')"
                    value="false">
                </el-option>
            </el-select>
            </el-form-item>
                  {{- else }}
        <el-form-item label="{{.FieldDesc}}">
          <el-input v-model="searchInfo.{{.FieldJson}}" :placeholder="t('general.searchCriteria')" />
        </el-form-item>{{ end }}{{ end }}{{ end }}
        <el-form-item>
          <el-button size="small" type="primary" icon="search" @click="onSubmit">{{ "{{ t('search') }}" }}</el-button>
          <el-button size="small" icon="refresh" @click="onReset">{{ "{{ t('reset') }}" }}</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
        <div class="gva-btn-list">
            <el-button size="small" type="primary" icon="plus" @click="openDialog">{{ "{{ t('general.add') }}" }}</el-button>
            <el-popover v-model:visible="deleteVisible" placement="top" width="160">
            <p>{{" {{ t('general.deleteConfirm') }}" }}</p>
            <div style="text-align: right; margin-top: 8px;">
                <el-button size="small" type="text" @click="deleteVisible = false">{{ "{{ t('general.cancel') }}" }}</el-button>
                <el-button size="small" type="primary" @click="onDelete">{{ "{{ t('general.confirm') }}" }}</el-button>
            </div>
            <template #reference>
                <el-button icon="delete" size="small" style="margin-left: 10px;" :disabled="!multipleSelection.length">{{ "{{ t('general.delete') }}" }}</el-button>
            </template>
            </el-popover>
        </div>
        <el-table
        ref="multipleTable"
        style="width: 100%"
        tooltip-effect="dark"
        :data="tableData"
        row-key="ID"
        @selection-change="handleSelectionChange"
        >
        <el-table-column type="selection" width="55" />
        <el-table-column align="left" :label="t('general.createdAt')" width="180">
            <template #default="scope">{{ "{{ formatDate(scope.row.CreatedAt) }}" }}</template>
        </el-table-column>
        {{- range .Fields}}
        {{- if .DictType}}
        <el-table-column align="left" label="{{.FieldDesc}}" prop="{{.FieldJson}}" width="120">
            <template #default="scope">
            {{"{{"}} filterDict(scope.row.{{.FieldJson}},{{.DictType}}Options) {{"}}"}}
            </template>
        </el-table-column>
        {{- else if eq .FieldType "bool" }}
        <el-table-column align="left" label="{{.FieldDesc}}" prop="{{.FieldJson}}" width="120">
            <template #default="scope">{{"{{"}} formatBoolean(scope.row.{{.FieldJson}}) {{"}}"}}</template>
        </el-table-column> {{- else }}
        <el-table-column align="left" label="{{.FieldDesc}}" prop="{{.FieldJson}}" width="120" />
        {{- end }}
        {{- end }}
        <el-table-column align="left" :label="t('')">
            <template #default="scope">
            <el-button type="text" icon="edit" size="small" class="table-button" @click="update{{.StructName}}Func(scope.row)">{{ "{{ t('edit') }}" }}</el-button>
            <el-button type="text" icon="delete" size="small" @click="deleteRow(scope.row)">{{ "{{ t('general.delete') }}" }}</el-button>
            </template>
        </el-table-column>
        </el-table>
        <div class="gva-pagination">
            <el-pagination
            layout="total, sizes, prev, pager, next, jumper"
            :current-page="page"
            :page-size="pageSize"
            :page-sizes="[10, 30, 50, 100]"
            :total="total"
            @current-change="handleCurrentChange"
            @size-change="handleSizeChange"
            />
        </div>
    </div>
    <el-dialog v-model="dialogFormVisible" :before-close="closeDialog" :title="t('Create')">
      <el-form :model="formData" label-position="right" label-width="20%">
    {{- range .Fields}}
        <el-form-item label="{{.FieldDesc}}:">
      {{- if eq .FieldType "bool" }}
          <el-switch v-model="formData.{{.FieldJson}}" active-color="#13ce66" inactive-color="#ff4949" active-text="Yes" inactive-text="No" clearable ></el-switch>
      {{- end }}
      {{- if eq .FieldType "string" }}
          <el-input v-model="formData.{{.FieldJson}}" clearable placeholder="please enter" />
      {{- end }}
      {{- if eq .FieldType "int" }}
      {{- if .DictType}}
          <el-select v-model="formData.{{ .FieldJson }}" placeholder="please choose" style="width:100%" clearable>
            <el-option v-for="(item,key) in {{ .DictType }}Options" :key="key" :label="item.label" :value="item.value" />
          </el-select>
      {{- else }}
          <el-input v-model.number="formData.{{ .FieldJson }}" clearable placeholder="please enter" />
      {{- end }}
      {{- end }}
      {{- if eq .FieldType "time.Time" }}
          <el-date-picker v-model="formData.{{ .FieldJson }}" type="date" style="width:100%" placeholder="select date" clearable />
      {{- end }}
      {{- if eq .FieldType "float64" }}
          <el-input-number v-model="formData.{{ .FieldJson }}"  style="width:100%" :precision="2" clearable />
      {{- end }}
        </el-form-item>
      {{- end }}
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closeDialog">Cancel</el-button>
          <el-button size="small" type="primary" @click="enterDialog">Save</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: '{{.StructName}}'
}
</script>

<script setup>
import {
  create{{.StructName}},
  delete{{.StructName}},
  delete{{.StructName}}ByIds,
  update{{.StructName}},
  find{{.StructName}},
  get{{.StructName}}List
} from '@/api/{{.PackageName}}'

// Full introduction of formatting tools, please keep as needed
import { getDictFunc, formatDate, formatBoolean, filterDict } from '@/utils/format'
import { ElMessage, ElMessageBox } from 'element-plus'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n' // added by mohamed hassan to support multilanguage

const { t } = useI18n() // added by mohamed hassan to support multilanguage

// Auto-generated dictionaries (may be empty) and fields
    {{- range $index, $element := .DictTypes}}
const {{ $element }}Options = ref([])
    {{- end }}
const formData = ref({
        {{- range .Fields}}
        {{- if eq .FieldType "bool" }}
        {{.FieldJson}}: false,
        {{- end }}
        {{- if eq .FieldType "string" }}
        {{.FieldJson}}: '',
        {{- end }}
        {{- if eq .FieldType "int" }}
        {{.FieldJson}}: {{- if .DictType }} undefined{{ else }} 0{{- end }},
        {{- end }}
        {{- if eq .FieldType "time.Time" }}
        {{.FieldJson}}: new Date(),
        {{- end }}
        {{- if eq .FieldType "float64" }}
        {{.FieldJson}}: 0,
        {{- end }}
        {{- end }}
        })

// =========== form control section ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})

// reset
const onReset = () => {
  searchInfo.value = {}
}

//search
const onSubmit = () => {
  page.value = 1
  pageSize.value = 10
{{- range .Fields}}{{- if eq .FieldType "bool" }}
  if (searchInfo.value.{{.FieldJson}} === ""){
      searchInfo.value.{{.FieldJson}}=null
  }{{ end }}{{ end }}
  getTableData()
}

// pagination
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

//Modify page size
const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

//Inquire
const getTableData = async() => {
  const table = await get{{.StructName}}List({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()

// ==============end of form control section===============

// Get the required dictionary, may be empty, keep as needed
const setOptions = async () =>{
{{- range $index, $element := .DictTypes }}
    {{ $element }}Options.value = await getDictFunc('{{$element}}')
{{- end }}
}

// Get the required dictionary, may be empty, keep as needed
setOptions()


// Multiple choice data
const multipleSelection = ref([])
// Multiple choice
const handleSelectionChange = (val) => {
    multipleSelection.value = val
}

// delete row
const deleteRow = (row) => {
    ElMessageBox.confirm('You sure you want to delete it?', 'hint', {
        confirmButtonText: 'Save',
        cancelButtonText: 'Cancel',
        type: 'warning'
    }).then(() => {
            delete{{.StructName}}Func(row)
        })
    }


// delete control tags
const deleteVisible = ref(false)

//Multiple selection delete
const onDelete = async() => {
      const ids = []
      if (multipleSelection.value.length === 0) {
        ElMessage({
          type: 'warning',
          message: 'Please select the data to delete'
        })
        return
      }
      multipleSelection.value &&
        multipleSelection.value.map(item => {
          ids.push(item.ID)
        })
      const res = await delete{{.StructName}}ByIds({ ids })
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: 'successfully deleted'
        })
        if (tableData.value.length === ids.length && page.value > 1) {
          page.value--
        }
        deleteVisible.value = false
        getTableData()
      }
    }

// Behavior control mark (need to be added or changed inside the pop-up window)
const type = ref('')

// update row
const update{{.StructName}}Func = async(row) => {
    const res = await find{{.StructName}}({ ID: row.ID })
    type.value = 'update'
    if (res.code === 0) {
        formData.value = res.data.re{{.Abbreviation}}
        dialogFormVisible.value = true
    }
}


// delete row
const delete{{.StructName}}Func = async (row) => {
    const res = await delete{{.StructName}}({ ID: row.ID })
    if (res.code === 0) {
        ElMessage({
                type: 'success',
                message: 'successfully deleted'
            })
            if (tableData.value.length === 1 && page.value > 1) {
            page.value--
        }
        getTableData()
    }
}

// popup control marker
const dialogFormVisible = ref(false)

//Open popup
const openDialog = () => {
    type.value = 'create'
    dialogFormVisible.value = true
}

// close popup
const closeDialog = () => {
    dialogFormVisible.value = false
    formData.value = {
    {{- range .Fields}}
        {{- if eq .FieldType "bool" }}
        {{.FieldJson}}: false,
        {{- end }}
        {{- if eq .FieldType "string" }}
        {{.FieldJson}}: '',
        {{- end }}
        {{- if eq .FieldType "int" }}
        {{.FieldJson}}: {{- if .DictType }} undefined{{ else }} 0{{- end }},
        {{- end }}
        {{- if eq .FieldType "time.Time" }}
        {{.FieldJson}}: new Date(),
        {{- end }}
        {{- if eq .FieldType "float64" }}
        {{.FieldJson}}: 0,
        {{- end }}
        {{- end }}
        }
}
// Popup OK
const enterDialog = async () => {
      let res
      switch (type.value) {
        case 'create':
          res = await create{{.StructName}}(formData.value)
          break
        case 'update':
          res = await update{{.StructName}}(formData.value)
          break
        default:
          res = await create{{.StructName}}(formData.value)
          break
      }
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: 'Create/change successful'
        })
        closeDialog()
        getTableData()
      }
}
</script>

<style>
</style>
