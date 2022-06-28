
<template>
  <el-row
    ><el-col :span="8"> </el-col>
    <el-col :span="8" style="font-size: 1.2em"> </el-col
    ><el-col :span="8">
      <el-select
        v-model="formData.gateway"
        clearable
        placeholder="please select gateway"
        v-on:change="onChangeSelectGateway"
      >
        <el-option
          v-for="item in gatewaysData"
          :key="item.ID"
          :label="`${item.nameEn}`"
          :value="item.domainNameService"
        />
      </el-select>
    </el-col>
  </el-row>
  <!-- <el-button v-on:click="addModelBoolean = !addModelBoolean">Add</el-button> -->
  <div class="gva-table-box">
    <div class="gva-btn-list">
      <el-button size="small" type="primary" icon="plus" @click="openDialog">{{
        t("general.add")
      }}</el-button>
      <!-- <el-popover v-model:visible="deleteVisible" placement="top" width="160">
        <p>{{ t("general.deleteConfirm") }}</p>
        <div style="text-align: right; margin-top: 8px">
          <el-button size="small" type="text" @click="deleteVisible = false">{{
            t("general.cancel")
          }}</el-button>
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
      </el-popover> -->
    </div>
    <el-table
      ref="multipleTable"
      style="width: 100%"
      tooltip-effect="dark"
      :data="formData.fields"
      row-key="fid"
      table-layout="auto"
      @selection-change="handleSelectionChange"
    >
      <!-- <el-table-column type="selection" width="55" /> -->
      <!-- <el-table-column align="left" :label="t('general.createdAt')" width="180">
        <template #default="scope">{{
          formatDate(scope.row.CreatedAt)
        }}</template>
      </el-table-column> -->
      <el-table-column align="center" label="Field Name" prop="fid" />
      <el-table-column
        align="center"
        label="Mapping Name"
        prop="matchingName"
      />
      <el-table-column align="center" :label="t('general.operations')">
        <template #default="scope">
          <el-button
            type="text"
            icon="edit"
            size="small"
            class="table-button"
            @click="updateFieldsFunc(scope.row)"
            >{{ t("general.change") }}</el-button
          >
          <!-- <el-button
            type="text"
            icon="delete"
            size="small"
            @click="deleteRow(scope.row)"
            >{{ t("general.delete") }}</el-button
          > -->
        </template>
      </el-table-column>
    </el-table>
  </div>
  <!--Add Popup Model-->
  <el-dialog
    v-model="addModelBoolean"
    :title="formData.gateway"
    :before-close="closeDialog"
  >
    <el-row>
      <el-col :span="24">
        <el-form>
          <el-row>
            <el-col :span="12">
              <el-button
                size="small"
                type="primary"
                icon="plus"
                @click="addFields(formData)"
                >{{ t("general.add") }}</el-button
              >
            </el-col>
          </el-row>
          <el-row>
            <el-col
              class="entry-box"
              :span="10"
              v-for="(applicant, counter) in formData.fields"
              v-bind:key="counter"
            >
              <el-row>
                <el-col :span="1"
                  ><el-icon
                    :size="size"
                    :color="color"
                    style="
                      cursor: pointer;
                      border: 1px solid black;
                      border-radius: 45%;
                    "
                    @click="deleteFields(formData, counter)"
                  >
                    <Close /> </el-icon
                ></el-col>
              </el-row>
              <el-row>
                <el-col :span="10">
                  <el-select
                    clearable
                    placeholder="please select service field"
                    v-model="applicant.fid"
                  >
                    <el-option
                      v-for="item in fieldsData"
                      :key="item.ID"
                      :label="`${item.nameAr}`"
                      :value="item.ID"
                    />
                  </el-select>
                </el-col>
                <el-col :span="1"></el-col>
                <el-col :span="10">
                  <el-input
                    type="text"
                    v-model="applicant.matchingName"
                    required
                    placeholder="Mapping Name"
                  ></el-input>
                </el-col>
              </el-row>
              <el-row>
                <el-br />
              </el-row>
              <!-- <input type="text" v-model="applicant.fieldName" required> -->
            </el-col>
          </el-row>
        </el-form>
        <el-span> </el-span>
      </el-col>
    </el-row>
    <el-button
      size="small"
      type="primary"
      icon="check"
      @click="confirm(formData)"
      >{{ t("general.confirm") }}</el-button
    >
  </el-dialog>

  <!-- Edit Popup Model -->
  <el-dialog
    v-model="editModelBoolean"
    :title="formData.gateway"
    :before-close="closeDialog"
  >
    <el-row>
      <el-col :span="24">
        <el-form>
          <el-row>
            <el-col :span="10">
              <el-input v-model="editFormData.field_name" readonly />
            </el-col>
            <el-col :span="2"></el-col>
            <el-col :span="10">
              <el-input v-model="editFormData.mapping_name" />
            </el-col>
          </el-row>
        </el-form>
      </el-col>
    </el-row>
    <el-button
      size="small"
      type="primary"
      icon="check"
      @click="confirmEdit(editFormData)"
      >{{ t("general.confirm") }}</el-button
    >
  </el-dialog>
  <!-- </div> -->
</template>

<script setup>
import { ref } from "vue";
import { getGatewaysList, getGatewayServiceFields } from "@/api/gateways";
import { getFieldsList } from "@/api/fields";
import { createServiceFields, updateServiceFields } from "@/api/servicefields";
import { ElMessage, ElMessageBox } from "element-plus";
import { useI18n } from "vue-i18n";
const gatewaysData = ref([]);
const fieldsData = ref([]);
let editFormData = ref({
  // id: 0,
  field_name: "",
  mapping_name: "",
});
const { t } = useI18n();
const getGatewaysData = async () => {
  const table = await getGatewaysList();
  if (table.code === 0) {
    gatewaysData.value = table.data.list;
  }
};
const deleteRow = (row) => {
  ElMessageBox.confirm(t("general.deleteConfirm"), t("general.hint"), {
    confirmButtonText: t("general.confirm"),
    cancelButtonText: t("general.cancel"),
    type: "warning",
  }).then(() => {
    deleteFieldFunc(row);
  });
};
const deleteFieldFunc = (row) => {
  row = {
    id: row.id,
    field_name: row.field_name,
    mapping_name: row.mapping_name,
  };
  console.log("row ", row);
  let tempData = formData.value.fields;
  // const res = await deleteProviders({ ID: row.id });
  for (let index = 0; index < tempData.length; index++) {
    console.log(tempData[index]);
    const d = tempData[index].id;
    if (d == row.id) {
      delete tempData[index];
      ElMessage({
        type: "success",
        message: t("general.deleteSuccess"),
      });
      formData.value.fields = tempData;
      return;
    }
  }
  // if (res.code === 0) {
  //   ElMessage({
  //     type: "success",
  //     message: t("general.deleteSuccess"),
  //   });
  //   if (tableData.value.length === 1 && page.value > 1) {
  //     page.value--;
  //   }
  //   // getTableData();
  // }
};
const onChangeSelectGateway = async (val) => {
  console.log(val);
  // load data using dns
  let res = await getGatewayServiceFields({ dns: val });
  // console.log(res.code);
  // console.log(res.data);
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: "get data successfully",
    });
    const data = res.data;

    formData.value.fields = data;
  }

  // closeForm();
};
const updateFieldsFunc = async (row) => {
  editModelBoolean.value = true;
  // console.log(row);
  editFormData.value.field_name = row.fid;
  editFormData.value.mapping_name = row.matchingName;
  // const res = await findProviders({ ID: row.ID });
  // type.value = "update";
  // if (res.code === 0) {
  //   formData.value = res.data.reproviders;
  //   dialogFormVisible.value = true;
  // }
};
const addModelBoolean = ref(false);
const editModelBoolean = ref(false);

getGatewaysData();

const confirm = async (formData) => {
  console.log("====redirefunc===");
  let res;

  res = await createServiceFields(formData);
  console.log(res.code);
  if (res.code === 0) {
    ElMessage({
      type: "success",
      message: t("general.createUpdateSuccess"),
    });
  }

  closeForm();

  console.log(formData);
};
const confirmEdit = async () => {
  console.log("====redirefunc===");

  let tempTableData = formData.value;
  for (let index = 0; index < tempTableData.fields.length; index++) {
    let element = tempTableData.fields[index];
    if (element.fid == editFormData.value.field_name) {
      tempTableData.fields[index].matchingName =
        editFormData.value.mapping_name;
    }
  }

  console.log(tempTableData);
  let res = await updateServiceFields(tempTableData);
  console.log(res);
  if (res.code === 0) {
    formData.value = tempTableData;
    ElMessage({
      type: "success",
      message: t("general.createUpdateSuccess"),
    });
  } else {
    ElMessage({
      type: "fail",
      message: "fail to update",
    });
  }

  closeForm();
};
const closeForm = () => {
  closeDialog();
};
const closeDialog = () => {
  addModelBoolean.value = false;
  editModelBoolean.value = false;
  // formData.value = { gateway: formData.value.gateway, fields: [] };
  // editFormData.value = {
  //   id: 0,
  //   field_name: "",
  //   mapping_name: "",
  // };
};
const openDialog = () => {
  addModelBoolean.value = true;
};

const getFieldsData = async () => {
  const table = await getFieldsList();
  if (table.code === 0) {
    fieldsData.value = table.data.list;
  }
};

getFieldsData();
// 自动化生成的字典（可能为空）以及字段
let formData = ref({
  gateway: "",

  fields: [
    // {
    //   fid: 0,
    //   matchingName: "",
    // },
  ],
});
</script>

<script>
export default {
  name: "serviceFields",
  props: {
    msg: String,
  },
  data() {
    return {
      fields: [
        {
          fid: 0,
          matchingName: "",
        },
      ],
    };
  },
  methods: {
    addFields(formData) {
      formData.fields.push({
        fid: 0,
        matchingName: "",
      });
    },
    deleteFields(formData, counter) {
      formData.fields.splice(counter, 1);
    },
  },
};
</script>



<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>



<style scoped>
.entry-box {
  box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
  transition: 0.3s;
  margin: 10px;
  padding: 2%;
}
</style>