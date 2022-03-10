<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="80px">
        <el-form-item label="appId field:">
          <el-input v-model.number="formData.appId" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="imei field:">
          <el-input v-model="formData.imei" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="sn field:">
          <el-input v-model="formData.sn" clearable placeholder="please enter" />
        </el-form-item>
        <el-form-item label="userId field:">
          <el-input v-model.number="formData.userId" clearable placeholder="please enter" />
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
  name: 'Terminal'
}
</script>

<script setup>
import {
  createTerminal,
  updateTerminal,
  findTerminal
} from '@/api/terminal'

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
        appId: 0,
        imei: '',
        sn: '',
        userId: 0,
        })

//initialization method
const init = async () => {
 // It is recommended to pass the url parameter to obtain the target data ID and call the find method to query the data operation to determine whether the page is create or update The following is an example of id as the url parameter
    if (route.query.id) {
      const res = await findTerminal({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.reterminal
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
          res = await createTerminal(formData.value)
          break
        case 'update':
          res = await updateTerminal(formData.value)
          break
        default:
          res = await createTerminal(formData.value)
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
