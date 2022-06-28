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
            >{{ t("general.search") }}</el-button
          >
          <el-button size="small" icon="refresh" @click="onReset">{{
            t("general.reset")
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
              @click="deleteVisible = true"
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
        :table-layout="tableLayout"
      >
        <el-table-column type="selection" width="auto" />
        <el-table-column align="left" :label="t('general.createdAt')">
          <template #default="scope">{{
            formatDate(scope.row.CreatedAt)
          }}</template>
        </el-table-column>
        <el-table-column
          align="left"
          label="catId "
          prop="catId"
          width="auto"
        />
        <el-table-column
          align="left"
          label="provId "
          prop="provId"
          width="auto"
        />
        <el-table-column
          align="left"
          label="nameAr "
          prop="nameAr"
          width="auto"
        />
        <el-table-column
          align="left"
          label="nameEn "
          prop="nameEn"
          width="auto"
        />
        <el-table-column
          align="left"
          label="isPrice "
          prop="isPrice"
          width="auto"
        />
        <el-table-column
          align="left"
          label="price "
          prop="price"
          width="auto"
        />
        <el-table-column align="left" label="inq " prop="inq" width="auto" />
        <el-table-column
          align="left"
          label="count "
          prop="count"
          width="auto"
        />
        <el-table-column
          align="left"
          label="isPar "
          prop="isPar"
          width="auto"
        />
        <el-table-column
          align="left"
          label="default dns "
          prop="defaultGatewayDn"
          width="auto"
        />
        <el-table-column
          align="left"
          label="status"
          prop="status"
          width="auto"
        />
        <el-table-column align="left" :label="t('general.operations')">
          <template #default="scope">
            <el-button
              type="text"
              icon="edit"
              size="small"
              class="table-button"
              @click="updateServicesFunc(scope.row)"
              >{{ t("general.change") }}</el-button
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
    <!-- :before-close="closeDialog" -->
    <el-dialog v-model="dialogFormVisible" :title="t('general.popUpOperation')">
      <el-form :model="formData" label-position="right" label-width="160px">
        <el-form-item label="catId :">
          <el-select
            v-model="formData.catId"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in categoriesData"
              :key="item.ID"
              :label="`${item.nameAr}`"
              :value="item.ID"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="provId :">
          <el-select
            v-model="formData.provId"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in providersData"
              :key="item.ID"
              :label="`${item.nameAr}`"
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
              v-for="(item, index) in gatewaysData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.ID"
              :v-bind="index"
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
              :label="`${item.nameAr}`"
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
          <el-input
            v-model="formData.nameAr"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="nameEn :">
          <el-input
            v-model="formData.nameEn"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="isPrice :">
          <el-input
            v-model.number="formData.isPrice"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="price :">
          <el-input-number
            v-model="formData.price"
            style="width: 100%"
            :precision="2"
            clearable
          />
        </el-form-item>
        <el-form-item label="inq :">
          <el-input
            v-model.number="formData.inq"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item labe l="count :">
          <el-input
            v-model.number="formData.count"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="isPar :">
          <el-input
            v-model.number="formData.isPar"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="defaultGatewayDn :">
          <el-select
            v-model="formData.defaultGatewayDn"
            clearable
            placeholder="please enter"
            style="width: 100%"
          >
            <el-option
              v-for="item in gatewaysData"
              :key="item.ID"
              :label="`${item.nameEn}`"
              :value="item.domainNameService"
            />
          </el-select>
          <span>{{ formData }}</span>
          
        </el-form-item>
        <el-form-item label="Status">
          <el-switch
            v-model="formData.status"
            active-color="#13ce66"
            inactive-color="#ff4949"
            :active-text="t('general.yes')"
            :inactive-text="t('general.no')"
            clearable
          ></el-switch>
        </el-form-item>
      </el-form>
      

      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closeDialog">{{
            t("general.close")
          }}</el-button>
          <el-button
            size="small"
            type="primary"
            @click="redirectDialog(formData, gatewaysData)"
            >{{ t("general.confirm") }}</el-button
          >
        </div>
      </template>
    </el-dialog>

    <!--start param model-->
    <!-- :before-close="closepkgDialog" -->
    <el-dialog v-model="dialogpkgVisible" :title="t('general.popUpOperation')">
      <div
        class="form"
        v-for="(item, index) in formData.gateways"
        v-bind:key="index"
      >
        
        <el-form :model="formData.services" label-position="right" label-width="160px">
          
          <label>{{ formData.services[index].dns }}</label>
          <el-form-item label="biller_code :">
            <el-input
              v-model="formData.services[index].params.biller_code"
              clearable
              :placeholder="t('general.pleaseEnter')"
            />
          </el-form-item>

          <el-form-item label="code :">
            <el-input
              v-model="formData.services[index].params.code"
              clearable
              :placeholder="t('general.pleaseEnter')"
            />
          </el-form-item>

          <div id="visa">
            <form>
              <button @click="addpkgsection(formData, index)">
                Add another pkg
              </button>
              <br />
              <div
                class="previous"
                v-for="(applicant, counter) in formData.services[index].params.pkgs"
                v-bind:key="counter"
              >
                <span @click="deletepkgsection(counter)">x</span>
                <label for="duration">{{ counter + 1 }}. pkgName:</label>

                <el-select
                  v-model="applicant.id"
                  clearable
                  placeholder="please enter"
                >
                  <el-option
                    v-for="item in pkgs"
                    :key="item.ID"
                    :label="`${item.nameAr}`"
                    :value="item.ID"
                  />
                </el-select>
                <label for="duration">:pckg_code</label>
                <input type="text" v-model="applicant.pckg_code" required />
                <label for="duration">evd_selector:</label>
                <input type="text" v-model="applicant.evd_selector" required />
              </div>
            </form>
          </div>
        </el-form>
      </div>
      <span> {{ formData }}</span>
      
      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closepkgDialog">{{
            t("general.close")
          }}</el-button>
          <el-button size="small" type="primary" @click="enterDialog">{{
            t("general.confirm")
          }}</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import { getFileList } from "@/api/fileUploadAndDownload";
import { downloadImage } from "@/utils/downloadImg";
import { useUserStore } from "@/pinia/modules/user";
import { formatDate } from "@/utils/format";
import { ref } from "vue";

import { ElMessage, ElMessageBox } from "element-plus";
// import JsonSchema from "@roma219/vue-jsonschema-form";
const path = ref(import.meta.env.VITE_BASE_API);
const userStore = useUserStore();

const imageUrl = ref("");

const page = ref(1);
const total = ref(0);
const pageSize = ref(10);
const tableData = ref([]);
let filePath = "";
// paging
const handleSizeChange = (val) => {
  pageSize.value = val;
  getTableData();
};

const handleCurrentChange = (val) => {
  page.value = val;
  getTableData();
};

// 查询
const getTableData = async () => {
  const table = await getFileList({
    page: page.value,
    pageSize: pageSize.value,
  });
  if (table.code === 0) {
    tableData.value = table.data.list;
    total.value = table.data.total;
    page.value = table.data.page;
    pageSize.value = table.data.pageSize;
    console.log(tableData.value);
  }
};
getTableData();

const fullscreenLoading = ref(false);





export default {
  name: "Test",
  props: {
    msg: String,
  },
  data() {
    return {
      pkgs: [
        {
          id: 0,
          pckg_code: "",
          evd_selector: "",
        },
      ],
    };
  },
  methods: {
    addpkgsection(formData, index) {
      formData.services[index].params.pkgs.push({
        id: 0,
        pckg_code: "",
        evd_selector: "",
      });
    },
    deletepkgsection(counter) {
      this.pkgs.splice(counter, 1);
    },
  },
};
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
import { getCategoriesList } from "@/api/categories";
import { getProvidersList } from "@/api/providers";
import { getGatewaysList } from "@/api/gateways";

import { getFieldsList } from "@/api/fields";
import { getVersionsList } from "@/api/versions";
import { getPackagesList } from "@/api/packages";

// 全量引入格式化工具 请按需保留
import { ElMessage, ElMessageBox } from "element-plus";
import { ref } from "vue";
import { useI18n } from "vue-i18n"; // added by mohamed hassan to support multilanguage

const { t } = useI18n(); // added by mohamed hassan to support multilanguage

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
  catId: "",
  provId: "",
  nameAr: "",
  nameEn: "",
  isPrice: 0,
  price: 0,
  inq: 0,
  count: 0,
  isPar: 0,
  status: false,
  defaultGatewayDn: "",
  services: [],
  gateways: [],
});

const generate_dynamicform = async (formData, gatewaysData) => {
 
  console.log(formData.gateways.length)
   
  for (let index = formData.services.length; index < formData.gateways.length; index++) {
    let obj = gatewaysData.find((o) => o.ID === formData.gateways[index]);

    let item = {
      dns: obj.domainNameService,

      params: {
        biller_code: "",
        code: "",
        pkgs: [
          {
            id: 0,
            pckg_code: "",
            evd_selector: "",
          },
        ],
      },
    };
    
 console.log("formData.serv");
    console.log(formData.fields);
    console.log(formData.services);
    formData.services.push(item);
   
  }
};

// =========== 表格控制部分 ===========
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
const pkgs = ref([]);
// ============= ================ ============

const onReset = () => {
  searchInfo.value = {};
};

// 搜索
const onSubmit = () => {
  page.value = 1;
  pageSize.value = 10;
  getTableData();
};

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val;
  getTableData();
};

// Modify the page capacity
const handleCurrentChange = (val) => {
  page.value = val;
  getTableData();
};

// 查询
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
  console.log(tableData.value);
};

getTableData();

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () => {};

// 获取需要的字典 可能为空 按需保留
setOptions();

// 多选数据
const multipleSelection = ref([]);
// 多选
const handleSelectionChange = (val) => {
  multipleSelection.value = val;
};

// 删除行
const deleteRow = (row) => {
  ElMessageBox.confirm(t("general.deleteConfirm"), t("general.hint"), {
    confirmButtonText: t("general.confirm"),
    cancelButtonText: t("general.cancel"),
    type: "warning",
  }).then(() => {
    deleteServicesFunc(row);
  });
};

// 批量删除控制标记
const deleteVisible = ref(false);

// 多选删除
const onDelete = async () => {
  const ids = [];
  if (multipleSelection.value.length === 0) {
    ElMessage({
      type: "warning",
      message: t("general.selectDataToDelete"),
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
      message: t("general.deleteSuccess"),
    });
    if (tableData.value.length === ids.length && page.value > 1) {
      page.value--;
    }
    deleteVisible.value = false;
    getTableData();
  }
};

// 行为控制标记（弹窗内部需要增还是改）
const type = ref("");

const tableLayout = ref("auto");
// Update the line
const updateServicesFunc = async (row) => {
  console.log("logggggggggggggggggggggggggggggggggggggggggggggggggggg: ")
  console.log(row)
  const res = await findServices({ ID: row.ID });
  console.log("res.data");
  console.log(res.code);
  type.value = "update";
  if (res.code === 0) {
    console.log("res.data.reservices: ")
  console.log(res.data.reservices)
    formData.value = res.data.reservices;
    // formData.serv = []
    dialogFormVisible.value = true;
  }
};

const deleteServicesFunc = async (row) => {
  const res = await deleteServices({ ID: row.ID });
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: t("general.deleteSuccess"),
    });
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--;
    }
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

const getPkgsData = async () => {
  const table = await getPackagesList();
  if (table.code === 0) {
    pkgs.value = table.data.list;
  }
};
getPkgsData();

// 弹窗控制标记
const dialogFormVisible = ref(false);
const gatewaysFormVisible = ref(false);
const dialogpkgVisible = ref(false);
const gatewaysJson = ref([]);
// 打开弹窗
const openDialog = () => {
  type.value = "create";

  dialogFormVisible.value = true;
};
const openpkgDialog = () => {
  dialogpkgVisible.value = true;
  console.log(dialogpkgVisible.value);
};

const openGatewayDialog = () => {
  type.value = "create";
  gatewaysFormVisible.value = true;
};

// Close Windows
const closeDialog = () => {
  dialogFormVisible.value = false;
  dialogpkgVisible.value = false;

  formData.value = {
     catId: "",
  provId: "",
  nameAr: "",
  nameEn: "",
  isPrice: 0,
  price: 0,
  inq: 0,
  count: 0,
  isPar: 0,
  status: false,
  defaultGatewayDn: "",
  services: [],
  gateways: [],
  fields:[],
    

  
  };
};

const closepkgDialog = () => {
  dialogpkgVisible.value = false;
  dialogFormVisible.value = false;
  formData.value = {
    catId: "",
  provId: "",
  nameAr: "",
  nameEn: "",
  isPrice: 0,
  price: 0,
  inq: 0,
  count: 0,
  isPar: 0,
  status: false,
  defaultGatewayDn: "",
  services: [],
  gateways: [],
  

  
  };
  window.location.reload();
};

const schema = {
  type: "object",
  properties: {
    a: {
      type: "string",
      title: "code",
    },
    b: {
      type: "string",
      title: "biller id",
    },
  },
};
const redirectDialog =  (formData, gatewaysData) => {
  
  dialogFormVisible.value=false
  generate_dynamicform(formData, gatewaysData);
  openpkgDialog();

};
// Popup window to determine
const enterDialog = async () => {
  let res;
  switch (type.value) {
    case "create":

      res = await createServices(formData.value);

      break;
    case "update":
      //formData.value.fileUrl = filePath;
        console.log("ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
      res = await updateServices(formData.value);
      break;
    default:
      res = await createServices(formData.value);
      break;
  }

  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: t("general.createUpdateSuccess"),
    });
    closeDialog();
    // closepkgDialog();

    getTableData();
  }
  console.log(res.code);
};
</script>





<style>
.previous {
  border: 1.5px solid;
  padding: 5px;
  margin-bottom: 10px;
  display: inline-block;
}
.form {
  border: 1.5px solid;
}
</style>
