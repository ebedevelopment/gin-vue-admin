<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="80px">
        <el-form-item label="createBy field:">
          <el-input v-model.number="formData.createBy" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="lastLogin field:">
          <el-date-picker v-model="formData.lastLogin" type="date" placeholder="select date" clearable></el-date-picker>
        </el-form-item>
        <el-form-item label="password field:">
          <el-input v-model="formData.password" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="status field:">
          <el-input v-model.number="formData.status" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="updateBy field:">
          <el-input v-model.number="formData.updateBy" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="userName field:">
          <el-input v-model="formData.userName" clearable placeholder="please enter" />
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
  name: 'Merchant'
}
</script>

<script setup>
import {
  createMerchant,
  updateMerchant,
  findMerchant
} from '@/api/merchant'

//get dictionary automatically
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n' // added by mohamed hassan to support multilanguage

const { t } = useI18n() // added by mohamed hassan to support multilanguage

const route = useRoute()
const router = useRouter()
const type = ref('')
const formData = ref({
        createBy: 0,
        lastLogin: new Date(),
        password: '',
        status: 0,
        updateBy: 0,
        userName: '',
        })

//initialization method
const init = async () => {
 // It is recommended to pass the url parameter to obtain the target data ID and call the find method to query the data operation to determine whether the page is create or update The following is an example of id as the url parameter
    if (route.query.id) {
      const res = await findMerchant({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.remerchant
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
//save button
const save = async() => {
      let res
      switch (type.value) {
        case 'create':
          res = await createMerchant(formData.value)
          break
        case 'update':
          res = await updateMerchant(formData.value)
          break
        default:
          res = await createMerchant(formData.value)
          break
      }
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: 'Create/Update successful'
        })
      }
}

// Back Button
const back = () => {
    router.go(-1)
}

</script>

<style>
</style>
