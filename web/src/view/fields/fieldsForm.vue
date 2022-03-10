<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="left" label-width="20%">
        <el-form-item label="double check:">
          <el-input
            v-model="formData.doubleCheck"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="max:">
          <el-input
            v-model.number="formData.max"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="min:">
          <el-input
            v-model.number="formData.min"
            clearable
            placeholder="please enter"
          />
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
        <el-form-item label="regex:">
          <el-input
            v-model="formData.regex"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="required:">
          <el-switch
            v-model="formData.required"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="Yes"
            inactive-text="No"
            clearable
          ></el-switch>
        </el-form-item>
        <el-form-item label="typeId:">
          <el-input
            v-model.number="formData.typeId"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" @click="save">Save</el-button>
          <el-button size="mini" type="primary" @click="back">Cancel</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Fields",
};
</script>

<script setup>
import { createFields, updateFields, findFields } from "@/api/fields";

//get dictionary automatically
import { getDictFunc } from "@/utils/format";
import { useRoute, useRouter } from "vue-router";
import { ElMessage } from "element-plus";
import { ref } from "vue";
import { useI18n } from "vue-i18n"; // added by mohamed hassan to support multilanguage

const { t } = useI18n(); // added by mohamed hassan to support multilanguage

const route = useRoute();
const router = useRouter();
const type = ref("");
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

//initialization method
const init = async () => {
  // It is recommended to pass the url parameter to obtain the target data ID and call the find method to query the data operation to determine whether the page is create or update The following is an example of id as the url parameter
  if (route.query.id) {
    const res = await findFields({ ID: route.query.id });
    if (res.code === 0) {
      formData.value = res.data.refields;
      type.value = "update";
    }
  } else {
    type.value = "create";
  }
};

init();
//save button
const save = async () => {
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
      message: "Create/Update successful",
    });
  }
};

// Back Button
const back = () => {
  router.go(-1);
};
</script>

<style>
</style>
