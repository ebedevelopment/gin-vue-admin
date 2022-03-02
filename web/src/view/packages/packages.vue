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
          label="field Name"
          prop="fieldId"
          width="120"
        />
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
        <el-table-column
          align="left"
          label="Package Code"
          prop="pkgCode"
          width="120"
        />
        <el-table-column align="left" :label="t('')">
          <template #default="scope">
            <el-button
              type="text"
              icon="edit"
              size="small"
              class="table-button"
              @click="updatePackagesFunc(scope.row)"
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
        <el-form-item label="Field Name:">
          <el-select
            v-model="formData.fieldId"
            placeholder="field name"
            style="width: 100%"
          >
            <el-option
              v-for="item in fields"
              :key="item.ID"
              :label="`${item.nameAr}`"
              :value="item.ID"
            />
          </el-select>
          <!-- <span>{{ formData.fieldId }}</span> -->
        </el-form-item>
        <el-form-item label="Arabic Name">
          <el-input
            v-model="formData.nameAr"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="English Name">
          <el-input
            v-model="formData.nameEn"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="Package Code">
          <el-input
            v-model="formData.pkgCode"
            clearable
            placeholder="please enter"
          />
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
export default {
  name: "Packages",
};
</script>

<script setup>
import {
  createPackages,
  deletePackages,
  deletePackagesByIds,
  updatePackages,
  findPackages,
  getPackagesList,
} from "@/api/packages";
import { getFieldsList } from "@/api/fields";
// Full introduction of formatting tools, please keep as needed
import {
  getDictFunc,
  formatDate,
  formatBoolean,
  filterDict,
} from "@/utils/format";
import { ElMessage, ElMessageBox } from "element-plus";
import { ref } from "vue";
import { useI18n } from "vue-i18n"; // added by mohamed hassan to support multilanguage

const { t } = useI18n(); // added by mohamed hassan to support multilanguage

// Auto-generated dictionaries (may be empty) and fields
const formData = ref({
  fieldId: "",
  nameAr: "",
  nameEn: "",
  pkgCode: "",
});

// =========== form control section ===========
const page = ref(1);
const total = ref(0);
const pageSize = ref(10);
const tableData = ref([]);
const searchInfo = ref({});

// reset
const onReset = () => {
  searchInfo.value = {};
};

//search
const onSubmit = () => {
  page.value = 1;
  pageSize.value = 10;
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
  const table = await getPackagesList({
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
    deletePackagesFunc(row);
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
  const res = await deletePackagesByIds({ ids });
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
const fields = ref([]);
// update row
const updatePackagesFunc = async (row) => {
  const res = await findPackages({ ID: row.ID });
  type.value = "update";
  if (res.code === 0) {
    formData.value = res.data.repackages;
    dialogFormVisible.value = true;
  }
};

// delete row
const deletePackagesFunc = async (row) => {
  const res = await deletePackages({ ID: row.ID });
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
    fieldId: 0,
    nameAr: "",
    nameEn: "",
    pkgCode: "",
  };
};
// Popup OK
const enterDialog = async () => {
  let res;
  switch (type.value) {
    case "create":
      res = await createPackages(formData.value);
      break;
    case "update":
      res = await updatePackages(formData.value);
      break;
    default:
      res = await createPackages(formData.value);
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

const getFieldsData = async () => {
  const table = await getFieldsList();
  if (table.code === 0) {
    fields.value = table.data.list;
  }
};
getFieldsData();
</script>

<style>
</style>
