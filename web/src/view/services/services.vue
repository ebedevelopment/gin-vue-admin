<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item>
          <el-button
            size="small"
            type="primary"
            icon="search"
            @click="onSubmit"
            >{{ t("search") }}</el-button
          >
          <el-button size="small" icon="refresh" @click="onReset">{{
            t("reset")
          }}</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button
          size="small"
          type="primary"
          icon="plus"
          @click="openDialog"
          >{{ t("general.add") }}</el-button
        >
        <el-popover v-model:visible="deleteVisible" placement="top" width="160">
          <p>{{ t("general.deleteConfirm") }}</p>
          <div style="text-align: right; margin-top: 8px">
            <el-button
              size="small"
              type="text"
              @click="deleteVisible = false"
              >{{ t("general.cancel") }}</el-button
            >
            <el-button size="small" type="primary" @click="onDelete">{{
              t("general.confirm")
            }}</el-button>
          </div>
          <template #reference>
            <el-button
              icon="delete"
              size="small"
              style="margin-left: 10px"
              :disabled="!multipleSelection.length"
              >{{ t("general.delete") }}</el-button
            >
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
        <el-table-column
          align="left"
          :label="t('general.createdAt')"
          width="180"
        >
          <template #default="scope">{{
            formatDate(scope.row.CreatedAt)
          }}</template>
        </el-table-column>
        <el-table-column
          align="left"
          label="category Name"
          prop="categoryId"
          width="120"
        />
        <el-table-column align="left" label="count" prop="count" width="120" />
        <el-table-column
          align="left"
          label="default Gateway"
          prop="defaultGateway"
          width="120"
        />
        <el-table-column
          align="left"
          label="inquirable"
          prop="inquirable"
          width="120"
        />
        <el-table-column align="left" label="isPar" prop="isPar" width="120" />
        <el-table-column
          align="left"
          label="isPrice"
          prop="isPrice"
          width="120"
        >
          <template #default="scope">{{
            formatBoolean(scope.row.isPrice)
          }}</template>
        </el-table-column>
        <el-table-column
          align="left"
          label="name Arabic"
          prop="nameAr"
          width="120"
        />
        <el-table-column
          align="left"
          label="name English"
          prop="nameEn"
          width="120"
        />
        <el-table-column align="left" label="price" prop="price" width="120" />
        <el-table-column
          align="left"
          label="provider name"
          prop="providerId"
          width="120"
        />
        <el-table-column align="left" :label="t('')">
          <template #default="scope">
            <el-button
              type="text"
              icon="edit"
              size="small"
              class="table-button"
              @click="updateServicesFunc(scope.row)"
              >{{ t("edit") }}</el-button
            >
            <el-button
              type="text"
              icon="delete"
              size="small"
              @click="deleteRow(scope.row)"
              >{{ t("general.delete") }}</el-button
            >
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
    <el-dialog
      v-model="dialogFormVisible"
      :before-close="closeDialog"
      :title="t('Create')"
    >
      <el-form :model="formData" label-position="left" label-width="20%">
        <el-form-item label="category Name:">
          <!-- <el-input v-model.number="formData.categoryId" clearable placeholder="please enter" /> -->
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
        <el-form-item label="count:">
          <el-input
            v-model.number="formData.count"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="default Gateway:">
          <!-- <el-input v-model="formData.defaultGateway" clearable placeholder="please enter" /> -->
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
        <el-form-item label="inquirable:">
          <el-input
            v-model.number="formData.inquirable"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="isPar:">
          <el-input
            v-model.number="formData.isPar"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="isPrice:">
          <el-switch
            v-model="formData.isPrice"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="Yes"
            inactive-text="No"
            clearable
          ></el-switch>
        </el-form-item>
        <el-form-item label="name Arabic:">
          <el-input
            v-model="formData.nameAr"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="name English:">
          <el-input
            v-model="formData.nameEn"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="price:">
          <el-input-number
            v-model="formData.price"
            style="width: 100%"
            :precision="2"
            clearable
          />
        </el-form-item>
        <el-form-item label="provider name:">
          <!-- <el-input v-model.number="formData.providerId" clearable placeholder="please enter" /> -->
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
          <el-button size="small" @click="closeDialog">Cancel</el-button>
          <el-button size="small" type="primary" @click="enterDialog"
            >Save</el-button
          >
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
  console.log("res.code :   ---------------------------------" ,filePath)
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
  getServicesList,
} from "@/api/services";
import {
  getDictFunc,
  formatDate,
  formatBoolean,
  filterDict,
} from "@/utils/format";
import { getProvidersList } from "@/api/providers";
import { getCategoriesList } from "@/api/categories";
import { getGatewaysList } from "@/api/gateways";
import { getFieldsList } from "@/api/fields";
import { getVersionsList } from "@/api/versions";

// Full introduction of formatting tools, please keep as needed
import { ElMessage, ElMessageBox } from "element-plus";
import { ref } from "vue";
import { useI18n } from "vue-i18n"; // added by mohamed hassan to support multilanguage

const { t } = useI18n(); // added by mohamed hassan to support multilanguage

// Auto-generated dictionaries (may be empty) and fields
const formData = ref({
  categoryId: "",
  count: 0,
  defaultGateway: "",
  inquirable: 0,
  isPar: 0,
  isPrice: false,
  nameAr: "",
  nameEn: "",
  price: 0,
  providerId: "",
  fileUrl:"",

});

// =========== form control section ===========
const page = ref(1);
const total = ref(0);
const pageSize = ref(10);
const tableData = ref([]);
const searchInfo = ref({});
const providersData = ref([]);
const categoriesData = ref([]);
const gatewaysData = ref([]);
const fieldsData = ref([]);
const versions = ref([]);

// reset
const onReset = () => {
  searchInfo.value = {};
};

//search
const onSubmit = () => {
  page.value = 1;
  pageSize.value = 10;
  if (searchInfo.value.isPrice === "") {
    searchInfo.value.isPrice = null;
  }
  getTableData();
};

// pagination
const handleSizeChange = (val) => {
  pageSize.value = val;
  getTableData();
};

//Modify page size
const handleCurrentChange = (val) => {
  page.value = val;
  getTableData();
};

//Inquire
const getTableData = async () => {
  const table = await getServicesList({
    page: page.value,
    pageSize: pageSize.value,
    ...searchInfo.value,
  });
  if (table.code === 0) {
    tableData.value = table.data.list;
    total.value = table.data.total;
    page.value = table.data.page;
    pageSize.value = table.data.pageSize;
  }
};

getTableData();

// ==============end of form control section===============

// Get the required dictionary, may be empty, keep as needed
const setOptions = async () => {};

// Get the required dictionary, may be empty, keep as needed
setOptions();

// Multiple choice data
const multipleSelection = ref([]);
// Multiple choice
const handleSelectionChange = (val) => {
  multipleSelection.value = val;
};

// delete row
const deleteRow = (row) => {
  ElMessageBox.confirm("You sure you want to delete it?", "hint", {
    confirmButtonText: "Save",
    cancelButtonText: "Cancel",
    type: "warning",
  }).then(() => {
    deleteServicesFunc(row);
  });
};

// delete control tags
const deleteVisible = ref(false);

//Multiple selection delete
const onDelete = async () => {
  const ids = [];
  if (multipleSelection.value.length === 0) {
    ElMessage({
      type: "warning",
      message: "Please select the data to delete",
    });
    return;
  }
  multipleSelection.value &&
    multipleSelection.value.map((item) => {
      ids.push(item.ID);
    });
  const res = await deleteServicesByIds({ ids });
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: "successfully deleted",
    });
    if (tableData.value.length === ids.length && page.value > 1) {
      page.value--;
    }
    deleteVisible.value = false;
    getTableData();
  }
};

// Behavior control mark (need to be added or changed inside the pop-up window)
const type = ref("");

// update row
const updateServicesFunc = async (row) => {
  const res = await findServices({ ID: row.ID });
  type.value = "update";
  if (res.code === 0) {
    formData.value = res.data.reservices;
    dialogFormVisible.value = true;
  }
};

// delete row
const deleteServicesFunc = async (row) => {
  const res = await deleteServices({ ID: row.ID });
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: "successfully deleted",
    });
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--;
    }
    getTableData();
  }
};

// popup control marker
const dialogFormVisible = ref(false);

//Open popup
const openDialog = () => {
  type.value = "create";
  dialogFormVisible.value = true;
};

// close popup
const closeDialog = () => {
  dialogFormVisible.value = false;
  formData.value = {
    categoryId: "",
    count: 0,
    defaultGateway: "",
    inquirable: 0,
    isPar: 0,
    isPrice: false,
    nameAr: "",
    nameEn: "",
    price: 0,
    providerId: "",
  };
};
// Popup OK
const enterDialog = async () => {
  let res;
  switch (type.value) {
    case "create":
      console.log("formdatavalue:",formData.value)
      formData.value.fileUrl=filePath
      console.log("formdataurlllll:",  formData.value.fileUrl)
      res = await createServices(formData.value);
      break;
    case "update":
     formData.value.fileUrl=filePath
      console.log("updateformdataurlllll:",  formData.value.fileUrl)
      res = await updateServices(formData.value);
      break;
    default:
      console.log("formdatavalue:",formData.value)
      formData.value.fileUrl=filePath
      console.log("formdataurlllll:",  formData.value.fileUrl)
      res = await createServices(formData.value);
      break;
  }
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: "Create/change successful",
    });
    closeDialog();
    getTableData();
  }
};

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
</script>

<style>
</style>
