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
        <el-table-column align="left" label="catId " prop="catId" width="120" />
        <el-table-column align="left" label="provId " prop="provId" width="120" />
        <el-table-column align="left" label="nameAr " prop="nameAr" width="120" />
        <el-table-column align="left" label="nameEn " prop="nameEn" width="120" />
        <el-table-column align="left" label="isPrice " prop="isPrice" width="120" />
        <el-table-column align="left" label="price " prop="price" width="120" />
        <el-table-column align="left" label="inq " prop="inq" width="120" />
        <el-table-column align="left" label="count " prop="count" width="120" />
        <el-table-column align="left" label="isPar " prop="isPar" width="120" />
        <el-table-column align="left" label="defaultGatewayDn " prop="defaultGatewayDn" width="120" />
        <el-table-column align="left" :label="t('general.operations')">
            <template #default="scope">
            <el-button type="text" icon="edit" size="small" class="table-button" @click="updateServicesFunc(scope.row)">{{ t('general.change') }}</el-button>
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
        <el-form-item label="catId field:">
       
           <el-select
            v-model="formData.categoryId"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in categoriesData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="provId field:">
          
          <el-select
            v-model="formData.providerId"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in providersData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
            />
          </el-select>
          
        </el-form-item>
            <el-form-item label="Gateways:">
          <el-select
            multiple
            v-model="formData.gateways"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in gatewaysData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="fields:">
          <el-select
            multiple
            v-model="formData.fields"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in fieldsData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>
         
        <el-form-item label="softwareVersion:">
          <el-select
            multiple
            v-model="formData.softwareVersion"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in versions"
              :key="item.ID"
              :label="`${item.softwareVersion}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="nameAr :">
          <el-input v-model="formData.nameAr" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameEn :">
          <el-input v-model="formData.nameEn" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="isPrice :">
          <el-input v-model.number="formData.isPrice" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="price :">
          <el-input-number v-model="formData.price"  style="width:100%" :precision="2" clearable />
        </el-form-item>
        <el-form-item label="inq :">
          <el-input v-model.number="formData.inq" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="count :">
          <el-input v-model.number="formData.count" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="isPar :">
          <el-input v-model.number="formData.isPar" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="defaultGatewayDn :">
         <el-select
            v-model="formData.defaultGateway"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in gatewaysData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>
         <el-form-item>
         <el-upload
         
          :action="`${path}/fileUploadAndDownload/upload`"
          :before-upload="checkFile"
          :headers="{ 'x-token': userStore.token }"
          :on-error="uploadError"
          :on-success="uploadSuccess"
          :show-file-list="false"
          class="upload-btn"
        >
          <el-button size="small" type="primary">upload</el-button>
        </el-upload>
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
import { getFileList, deleteFile } from '@/api/fileUploadAndDownload'
import { downloadImage } from '@/utils/downloadImg'
import { useUserStore } from '@/pinia/modules/user'
import CustomPic from '@/components/customPic/index.vue'
import UploadImage from '@/components/upload/image.vue'
import { formatDate } from '@/utils/format'

import { ref } from 'vue'
import * as fs from 'fs';

import { ElMessage, ElMessageBox } from 'element-plus'

const path = ref(import.meta.env.VITE_BASE_API)
const userStore = useUserStore()

const imageUrl = ref('')

const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
let filePath=''
// 分页
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

// 查询
const getTableData = async() => {
  const table = await getFileList({ page: page.value, pageSize: pageSize.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}
getTableData()


const fullscreenLoading = ref(false)
const checkFile = (file) => {
  fullscreenLoading.value = true
  const isJson = file.type === 'application/json'

  const isLt2M = file.size / 1024 / 1024 < 0.5
  if (!isJson ) {
    ElMessage.error('only json file')
    fullscreenLoading.value = false
  }
  if (!isLt2M) {
    ElMessage.error('未压缩未见上传图片大小不能超过 500KB，请使用压缩上传')
    fullscreenLoading.value = false
  }
  console.log("check ",file)
  return isJson && isLt2M
}
const uploadSuccess = (res) => {
   

  fullscreenLoading.value = false

     
      filePath=res.data.file.url

  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '上传成功'
    })
    if (res.code === 0) {

      getTableData()
    }
  } else {
    ElMessage({
      type: 'warning',
      message: res.msg
    })
  }
}

const uploadError = () => {
  console.log("upload error")
  ElMessage({
    type: 'error',
    message: '上传失败'
  })
  fullscreenLoading.value = false
}
const downloadFile = (row) => {
  if (row.url.indexOf('http://') > -1 || row.url.indexOf('https://') > -1) {
    downloadImage(row.url, row.name)
  } else {
    downloadImage(path.value + row.url, row.name)
  }
}
</script>


<script setup>
import {
  createServices,
  deleteServices,
  deleteServicesByIds,
  updateServices,
  findServices,
  getServicesList
} from '@/api/services'
import { getCategoriesList } from "@/api/categories";
import { getProvidersList } from "@/api/providers";
import { getGatewaysList } from "@/api/gateways";

import { getFieldsList } from "@/api/fields";
import { getVersionsList } from "@/api/versions";

// 全量引入格式化工具 请按需保留
import { getDictFunc, formatDate, formatBoolean, filterDict } from '@/utils/format'
import { ElMessage, ElMessageBox } from 'element-plus'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n' // added by mohamed hassan to support multilanguage

const { t } = useI18n() // added by mohamed hassan to support multilanguage

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
        catId: 0,
        provId: 0,
        nameAr: '',
        nameEn: '',
        isPrice: 0,
        price: 0,
        inq: 0,
        count: 0,
        isPar: 0,
        defaultGatewayDn: '',
        })

// =========== 表格控制部分 ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})
const providersData = ref([]);
const categoriesData = ref([]);
const gatewaysData = ref([]);
const fieldsData = ref([]);
const versions = ref([]);


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
  const table = await getServicesList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()



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
            deleteServicesFunc(row)
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
      const res = await deleteServicesByIds({ ids })
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
const updateServicesFunc = async(row) => {
    const res = await findServices({ ID: row.ID })
    type.value = 'update'
    if (res.code === 0) {
        formData.value = res.data.reservices
        dialogFormVisible.value = true
    }
}


// 删除行
const deleteServicesFunc = async (row) => {
    const res = await deleteServices({ ID: row.ID })
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


const getProvidersData = async () => {
  const table = await getProvidersList();
  if (table.code === 0) {
    providersData.value = table.data.list;
  }
};

getProvidersData();

const getCategoriesData = async () => {
  const table = await getCategoriesList();
  if (table.code === 0) {
    categoriesData.value = table.data.list;
  }
};

getCategoriesData();

const getGatewaysData = async () => {
  const table = await getGatewaysList();
  if (table.code === 0) {
    gatewaysData.value = table.data.list;
  }
};

getGatewaysData();
const getFieldsData = async () => {
  const table = await getFieldsList();
  if (table.code === 0) {
    fieldsData.value = table.data.list;
  }
};

getFieldsData();

const getVersionData = async () => {
  const table = await getVersionsList();
  if (table.code === 0) {
    versions.value = table.data.list;
  }
};

getVersionData();

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
        catId: 0,
        provId: 0,
        nameAr: '',
        nameEn: '',
        isPrice: 0,
        price: 0,
        inq: 0,
        count: 0,
        isPar: 0,
        defaultGatewayDn: '',
        }
}
// 弹窗确定
const enterDialog = async () => {
      let res
      switch (type.value) {
        case 'create':
          formData.value.fileUrl=filePath
            console.log("FilePath: ",formData.value.fileUrl)
          res = await createServices(formData.value)
          break
        case 'update':
          formData.value.fileUrl=filePath
          res = await updateServices(formData.value)
          break
        default:
          formData.value.fileUrl=filePath
          res = await createServices(formData.value)
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
