<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="left" label-width="20%">
        <!-- <el-form-item label="field Name:">
          <el-input
            v-model.number="formData.fieldId"
            clearable
            placeholder="please enter"
          />
        </el-form-item> -->
        <el-select
          multiple
          v-model="formData.fieldId"
          placeholder="Field id"
          style="width: 100%"
        >
          <el-option
            v-for="item in fieldIds"
            :key="item.ID"
            :label="`${item.name}`"
            :value="item.ID"
          />
        </el-select>
        <el-form-item label="Arabic Name:">
          <el-input
            v-model="formData.nameAr"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="English Name:">
          <el-input
            v-model="formData.nameEn"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="Package Code:">
          <el-input
            v-model="formData.pkgCode"
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
  name: "Packages",
};
</script>

<script setup>
import { createPackages, updatePackages, findPackages } from "@/api/packages";

//get dictionary automatically
import { useRoute, useRouter } from "vue-router";
import { ElMessage } from "element-plus";
import { ref } from "vue";
import { useI18n } from "vue-i18n"; // added by mohamed hassan to support multilanguage

const { t } = useI18n(); // added by mohamed hassan to support multilanguage

const route = useRoute();
const router = useRouter();
const type = ref("");
const formData = ref({
  fieldId: 0,
  nameAr: "",
  nameEn: "",
  pkgCode: "",
});

//initialization method
const init = async () => {
  // It is recommended to pass the url parameter to obtain the target data ID and call the find method to query the data operation to determine whether the page is create or update The following is an example of id as the url parameter
  if (route.query.id) {
    const res = await findPackages({ ID: route.query.id });
    if (res.code === 0) {
      formData.value = res.data.repackages;
      type.value = "update";
    }
  } else {
    type.value = "create";
    console.log("2222");
  }
};

init();

//save button
const save = async () => {
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
