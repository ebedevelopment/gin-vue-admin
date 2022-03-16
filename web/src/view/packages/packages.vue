<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item>
          <el-button size="small" type="primary" icon="search" @click="onSubmit">{{ t('general.search') }}</el-button>
          <el-button size="small" icon="refresh" @click="onReset">{{ t('general.reset') }}</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
        <div class="gva-btn-list">
            <el-button size="small" type="primary" icon="plus" @click="openDialog">{{ t('general.add') }}</el-button>
            <el-popover v-model:visible="deleteVisible" placement="top" width="160">
            <p> {{ t('general.deleteConfirm') }}</p>
            <div style="text-align: right; margin-top: 8px;">
                <el-button size="small" type="text" @click="deleteVisible = false">{{ t('general.cancel') }}</el-button>
                <el-button size="small" type="primary" @click="onDelete">{{ t('general.confirm') }}</el-button>
            </div>
            <template #reference>
                <el-button icon="delete" size="small" style="margin-left: 10px;" :disabled="!multipleSelection.length" @click="deleteVisible = true">{{ t('general.delete') }}</el-button>
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
            <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>
        <el-table-column align="left" label="nameAr field" prop="nameAr" width="120" />
        <el-table-column align="left" label="nameEn field" prop="nameEn" width="120" />
        <el-table-column align="left" label="pckgCode field" prop="pckgCode" width="120" />
        <el-table-column align="left" label="fieldId field" prop="fieldId" width="120" />
        <el-table-column align="left" :label="t('general.operations')">
            <template #default="scope">
            <el-button type="text" icon="edit" size="small" class="table-button" @click="updatePackagesFunc(scope.row)">{{ t('general.change') }}</el-button>
            <el-button type="text" icon="delete" size="small" @click="deleteRow(scope.row)">{{ t('general.delete') }}</el-button>
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
    <el-dialog v-model="dialogFormVisible" :before-close="closeDialog" :title="t('general.popUpOperation')">
      <el-form :model="formData" label-position="right" label-width="80px">
        <el-form-item label="nameAr :">
          <el-input v-model="formData.nameAr" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameEn :">
          <el-input v-model="formData.nameEn" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="pckgCode :">
          <el-input v-model="formData.pckgCode" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="fieldId :">
         <el-select v-model="formData.fieldId" clearable placeholder="please enter" style="width:100%">
           <el-option 
               v-for="item in fields" 
              :key= "item.ID"
              :label="`${item.nameEn}`"
              :value= "item.ID"
            />
             </el-select>
        </el-form-item>
        
      </el-form>

      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closeDialog">{{ t('general.close') }}</el-button>
          <el-button size="small" type="primary" @click="enterDialog">{{ t('general.confirm') }}</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'Packages'
}
</script>

<script setup>
import {
  createPackages,
  deletePackages,
  deletePackagesByIds,
  updatePackages,
  findPackages,
  getPackagesList
} from '@/api/packages'
import{
getFieldsList
}from '@/api/fields'
// 全量引入格式化工具 请按需保留
import { getDictFunc, formatDate, formatBoolean, filterDict } from '@/utils/format'
import { ElMessage, ElMessageBox } from 'element-plus'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n' // added by mohamed hassan to support multilanguage

const { t } = useI18n() // added by mohamed hassan to support multilanguage

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
        nameAr: '',
        nameEn: '',
        pckgCode: '',
        fieldId: 0,
        })

// =========== 表格控制部分 ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})
const fields = ref({})
// 重置
const onReset = () => {
  searchInfo.value = {}
}

// 搜索
const onSubmit = () => {
  page.value = 1
  pageSize.value = 10
  getTableData()
}

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

// 修改页面容量
const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

// 查询
const getTableData = async() => {
  const table = await getPackagesList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()





const getFeildsData = async() => {
  const table = await getFieldsList()
  if (table.code === 0) {
    fields.value= table.data.list
    
   
  }

}

getFeildsData()
// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () =>{
}

// 获取需要的字典 可能为空 按需保留
setOptions()


// 多选数据
const multipleSelection = ref([])
// 多选
const handleSelectionChange = (val) => {
    multipleSelection.value = val
}

// 删除行
const deleteRow = (row) => {
    ElMessageBox.confirm(t('general.deleteConfirm'), t('general.hint'), {
        confirmButtonText: t('general.confirm'),
        cancelButtonText: t('general.cancel'),
        type: 'warning'
    }).then(() => {
            deletePackagesFunc(row)
        })
    }


// 批量删除控制标记
const deleteVisible = ref(false)

// 多选删除
const onDelete = async() => {
      const ids = []
      if (multipleSelection.value.length === 0) {
        ElMessage({
          type: 'warning',
          message: t('general.selectDataToDelete')
        })
        return
      }
      multipleSelection.value &&
        multipleSelection.value.map(item => {
          ids.push(item.ID)
        })
      const res = await deletePackagesByIds({ ids })
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: t('general.deleteSuccess')
        })
        if (tableData.value.length === ids.length && page.value > 1) {
          page.value--
        }
        deleteVisible.value = false
        getTableData()
      }
    }

// 行为控制标记（弹窗内部需要增还是改）
const type = ref('')

// 更新行
const updatePackagesFunc = async(row) => {
    const res = await findPackages({ ID: row.ID })
    type.value = 'update'
    if (res.code === 0) {
        formData.value = res.data.repackages
        dialogFormVisible.value = true
    }
}


// 删除行
const deletePackagesFunc = async (row) => {
    const res = await deletePackages({ ID: row.ID })
    if (res.code === 0) {
        ElMessage({
                type: 'success',
                message: t('general.deleteSuccess')
            })
            if (tableData.value.length === 1 && page.value > 1) {
            page.value--
        }
        getTableData()
    }
}

// 弹窗控制标记
const dialogFormVisible = ref(false)

// 打开弹窗
const openDialog = () => {
    type.value = 'create'
    dialogFormVisible.value = true
}

// 关闭弹窗
const closeDialog = () => {
    dialogFormVisible.value = false
    formData.value = {
        nameAr: '',
        nameEn: '',
        pckgCode: '',
        fieldId: 0,
        }
}
// 弹窗确定
const enterDialog = async () => {
      let res
      switch (type.value) {
        case 'create':
          res = await createPackages(formData.value)
          break
        case 'update':
          res = await updatePackages(formData.value)
          break
        default:
          res = await createPackages(formData.value)
          break
      }
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: t('general.createUpdateSuccess')
        })
        closeDialog()
        getTableData()
      }
}
</script>

<style>
</style>
