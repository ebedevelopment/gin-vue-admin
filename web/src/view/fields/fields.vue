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
        :table-layout="tableLayout"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="auto" />
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
          label="doubleCheck "
          prop="doubleCheck"
          resizable
        />
        <el-table-column align="left" label="max " prop="max" resizable />
        <el-table-column align="left" label="min " prop="min" resizable />
        <el-table-column align="left" label="nameAr " prop="nameAr" resizable />
        <el-table-column align="left" label="nameEn " prop="nameEn" resizable />
        <el-table-column align="left" label="regex " prop="regex" resizable />
        <el-table-column
          align="left"
          label="required "
          prop="required"
          resizable
        >
          <template #default="scope">{{
            formatBoolean(scope.row.required)
          }}</template>
        </el-table-column>
        <el-table-column align="left" label="typeId " prop="typeId" resizable />
        <el-table-column align="left" :label="t('general.operations')">
          <template #default="scope">
            <el-button
              type="text"
              icon="edit"
              size="small"
              class="table-button"
              @click="updateFieldsFunc(scope.row)"
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
    <el-dialog
      v-model="dialogFormVisible"
      :before-close="closeDialog"
      :title="t('general.popUpOperation')"
    >
      <el-form :model="formData" label-position="right" label-width="120px">
        <el-form-item label="doubleCheck:">
          <el-input
            v-model="formData.doubleCheck"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="max :">
          <el-input
            v-model.number="formData.max"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="min :">
          <el-input
            v-model.number="formData.min"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
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
        <el-form-item label="regex :">
          <el-input
            v-model="formData.regex"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
        <el-form-item label="required :">
          <el-switch
            v-model="formData.required"
            active-color="#13ce66"
            inactive-color="#ff4949"
            :active-text="t('general.yes')"
            :inactive-text="t('general.no')"
            clearable
          ></el-switch>
        </el-form-item>
        <el-form-item label="typeId :">
          <el-input
            v-model.number="formData.typeId"
            clearable
            :placeholder="t('general.pleaseEnter')"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closeDialog">{{
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
export default {
  name: "Fields",
};
</script>

<script setup>
import {
  createFields,
  deleteFields,
  deleteFieldsByIds,
  updateFields,
  findFields,
  getFieldsList,
} from "@/api/fields";

// 全量引入格式化工具 请按需保留
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
const tableLayout = ref("auto");
// 自动化生成的字典（可能为空）以及字段
const formData = ref({
  doubleCheck: "",
  max: 0,
  min: 0,
  nameAr: "",
  nameEn: "",
  regex: "",
  required: false,
  typeId: 0,
});

// =========== 表格控制部分 ===========
const page = ref(1);
const total = ref(0);
const pageSize = ref(10);
const tableData = ref([]);
const searchInfo = ref({});

// 重置
const onReset = () => {
  searchInfo.value = {};
};

// 搜索
const onSubmit = () => {
  page.value = 1;
  pageSize.value = 10;
  if (searchInfo.value.required === "") {
    searchInfo.value.required = null;
  }
  getTableData();
};

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val;
  getTableData();
};

// 修改页面容量
const handleCurrentChange = (val) => {
  page.value = val;
  getTableData();
};

// 查询
const getTableData = async () => {
  const table = await getFieldsList({
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

//Inquire

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
    deleteFieldsFunc(row);
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
  const res = await deleteFieldsByIds({ ids });
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

// 更新行
const updateFieldsFunc = async (row) => {
  const res = await findFields({ ID: row.ID });
  type.value = "update";
  if (res.code === 0) {
    formData.value = res.data.refields;
    dialogFormVisible.value = true;
  }
};

// 删除行
const deleteFieldsFunc = async (row) => {
  const res = await deleteFields({ ID: row.ID });
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

// 弹窗控制标记
const dialogFormVisible = ref(false);

// 打开弹窗
const openDialog = () => {
  type.value = "create";
  dialogFormVisible.value = true;
};

// 关闭弹窗
const closeDialog = () => {
  dialogFormVisible.value = false;
  formData.value = {
    doubleCheck: "",
    max: 0,
    min: 0,
    nameAr: "",
    nameEn: "",
    regex: "",
    required: false,
    typeId: 0,
  };
};
// 弹窗确定
const enterDialog = async () => {
  let res;
  switch (type.value) {
    case "create":
      res = await createFields(formData.value);
      break;
    case "update":
      res = await updateFields(formData.value);
      break;
    default:
      res = await createFields(formData.value);
      break;
  }
  if (res.code === 0) {
    ElMessage({
      type: "success",

      message: t("general.createUpdateSuccess"),
    });
    closeDialog();
    getTableData();
  }
};
</script>

<style>
</style>
