
<template>
  <div id="serviceField" >
    <h1>Add service field</h1>
    <form>
      <label for="gateway">Gateway :</label>
      <el-select
        v-model="formData.gateway"
        clearable
        placeholder="please enter"
      
      >
        <el-option
          v-for="item in gatewaysData"
          :key="item.ID"
          :label="`${item.nameEn}`"
          :value="item.domainNameService"
        />
      </el-select>
      <br />

      <br /><br />
      <button @click="addFields(formData)">Add New field</button>
      <br />
      <div
        class="previous"
        v-for="(applicant, counter) in formData.fields"
        v-bind:key="counter"
      >
        <span @click="deleteFields(formData,counter)">x</span>
        <label for="duration">{{ counter + 1 }}. fieldName:</label>
        <!-- <input type="text" v-model="applicant.fieldName" required> -->
        <el-select
          v-model="applicant.fid"
          clearable
          placeholder="please enter"
          style=""
        >
          <el-option
            v-for="item in fieldsData"
            :key="item.ID"
            :label="`${item.nameAr}`"
            :value="item.ID"
          />
        </el-select>
        <label for="duration">mapping:</label>
        <input type="text" v-model="applicant.matchingName" required />
      </div>
     
  
    </form>
      
            <button class=".el-button " @click="confirm(formData)">confirm</button>

  </div>
</template>

<script setup>
import { ref } from "vue";
import { getGatewaysList } from "@/api/gateways";
import{getFieldsList}from "@/api/fields"
import { createServiceFields } from "@/api/servicefields";
// import { createServiceFields } from "@/api/service";
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

  formData.value= {
    gateway: "",

  fields:[],
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
.previous {
  border: 1.5px solid;
  padding: 5px;
  margin-bottom: 10px;  
    
}
</style>