
<template>
  <el-row
    ><el-col :span="8"> </el-col>
    <el-col :span="8" style="font-size: 1.2em">Set Field Map </el-col
    ><el-col :span="8"> </el-col>
  </el-row>

  <!-- <div id="serviceField"> -->
  <el-row>
    <el-col :span="24">
      <el-form>
        <el-row>
          <el-col :span="12">
            <el-select
              v-model="formData.gateway"
              clearable
              placeholder="please select gateway"
            >
              <el-option
                v-for="item in gatewaysData"
                :key="item.ID"
                :label="`${item.nameEn}`"
                :value="item.domainNameService"
              />
            </el-select>
          </el-col>
          <el-col :span="12">
            <button @click="addFields(formData)">Add New field</button>
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
                  style="cursor: pointer"
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

  <button class=".el-button" @click="confirm(formData)">confirm</button>
  <!-- </div> -->
</template>

<script setup>
import { ref } from "vue";
import { getGatewaysList } from "@/api/gateways";
import { getFieldsList } from "@/api/fields";
import { createServiceFields } from "@/api/servicefields";
import { useI18n } from "vue-i18n";
const gatewaysData = ref([]);
const fieldsData = ref([]);
const { t } = useI18n();
const getGatewaysData = async () => {
  const table = await getGatewaysList();
  if (table.code === 0) {
    gatewaysData.value = table.data.list;
  }
};

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

const closeForm = () => {
  formData.value = {
    gateway: "",

    fields: [],
  };
};

const getFieldsData = async () => {
  const table = await getFieldsList();
  if (table.code === 0) {
    fieldsData.value = table.data.list;
  }
};

getFieldsData();
// 自动化生成的字典（可能为空）以及字段
const formData = ref({
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
  name: "Test",
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
#serviceField {
  margin: 20px auto;
  max-width: 700px;
}
label {
  display: block;
  margin: 20px 0 10px;
}
input {
  font-size: 20px;
  border: 1px double rgb(102, 97, 96);
}
button {
  font-size: 16px;
  background: rgb(64, 118, 179);
  padding: 0.4rem 1.3rem;
  text-align: center;
  border: none;
  cursor: pointer;
  border-radius: 4px;
  margin: 10px;
}
span {
  width: 30px;
  float: right;
  cursor: pointer;
}
span:hover {
  color: brown;
}
.entry-box {
  box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
  transition: 0.3s;
  margin: 10px;
}
</style>