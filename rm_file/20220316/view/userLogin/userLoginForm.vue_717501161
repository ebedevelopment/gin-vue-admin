<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="20%">
        <el-form-item label="userId field:">
          <el-input v-model="formData.userId" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="password field:">
          <el-input v-model="formData.password" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="status field:">
          <el-input v-model.number="formData.status" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="lastLogin field:">
          <el-date-picker v-model="formData.lastLogin" type="date" :placeholder="t('general.selectDate')" clearable></el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" @click="save">{{ t('general.save') }}</el-button>
          <el-button size="mini" type="primary" @click="back">{{ t('general.back') }}</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UserLogin'
}
</script>

<script setup>
import {
  createUserLogin,
  updateUserLogin,
  findUserLogin
} from '@/api/userLogin'

// 自动获取字典
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
        userId: '',
        password: '',
        status: 0,
        lastLogin: new Date(),
        })

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findUserLogin({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.reuserLogin
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
// 保存按钮
const save = async() => {
      let res
      switch (type.value) {
        case 'create':
          res = await createUserLogin(formData.value)
          break
        case 'update':
          res = await updateUserLogin(formData.value)
          break
        default:
          res = await createUserLogin(formData.value)
          break
      }
      if (res.code === 0) {
        ElMessage({
          type: 'success',
          message: t('general.createUpdateSuccess')
        })
      }
}

// 返回按钮
const back = () => {
    router.go(-1)
}

</script>

<style>
</style>
