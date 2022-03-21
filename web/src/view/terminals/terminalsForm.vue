<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="20%">
        <el-form-item label="sn field:">
          <el-input v-model="formData.sn" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="imei field:">
          <el-input v-model="formData.imei" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="versionId field:">
          <el-input v-model.number="formData.versionId" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="merchantId field:">
          <el-input v-model.number="formData.merchantId" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="model:">
          <el-input v-model="formData.model" clearable :placeholder="t('general.pleaseEnter')" />
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
  name: 'Terminals'
}
</script>

<script setup>
import {
  createTerminals,
  updateTerminals,
  findTerminals
} from '@/api/terminals'

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
        sn: '',
        imei: '',
        versionId: 0,
        merchantId: 0,
        model: '',
        })

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findTerminals({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.reterminals
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
          res = await createTerminals(formData.value)
          break
        case 'update':
          res = await updateTerminals(formData.value)
          break
        default:
          res = await createTerminals(formData.value)
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
