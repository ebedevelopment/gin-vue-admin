<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="left" label-width="20%">
        <el-form-item label="category Name:">
          <el-input
            v-model.number="formData.categoryId"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="count:">
          <el-input
            v-model.number="formData.count"
            clearable
            placeholder="please enter"
          />
        </el-form-item>
        <el-form-item label="default Gateway:">
          <el-input
            v-model="formData.defaultGateway"
            clearable
            placeholder="please enter"
          />
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
            :precision="2"
            clearable
          ></el-input-number>
        </el-form-item>
        <el-form-item label="provider name:">
          <el-input
            v-model.number="formData.providerId"
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
  name: "Services",
};
</script>

<script setup>
import { createServices, updateServices, findServices } from "@/api/services";

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
  categoryId: 0,
  count: 0,
  defaultGateway: "",
  inquirable: 0,
  isPar: 0,
  isPrice: false,
  nameAr: "",
  nameEn: "",
  price: 0,
  providerId: 0,
});

//initialization method
const init = async () => {
  // It is recommended to pass the url parameter to obtain the target data ID and call the find method to query the data operation to determine whether the page is create or update The following is an example of id as the url parameter
  if (route.query.id) {
    const res = await findServices({ ID: route.query.id });
    if (res.code === 0) {
      formData.value = res.data.reservices;
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
      res = await createServices(formData.value);
      break;
    case "update":
      res = await updateServices(formData.value);
      break;
    default:
      res = await createServices(formData.value);
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
