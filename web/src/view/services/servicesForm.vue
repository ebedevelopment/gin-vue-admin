<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="20%">
        <el-form-item label="catId field:">
          <el-input v-model.number="formData.catId" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="provId field:">
          <el-input v-model.number="formData.provId" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameAr field:">
          <el-input v-model="formData.nameAr" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameEn field:">
          <el-input v-model="formData.nameEn" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="isPrice field:">
          <el-input v-model.number="formData.isPrice" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="price field:">
          <el-input-number v-model="formData.price" :precision="2" clearable></el-input-number>
        </el-form-item>
        <el-form-item label="inq field:">
          <el-input v-model.number="formData.inq" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="count field:">
          <el-input v-model.number="formData.count" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="isPar field:">
          <el-input v-model.number="formData.isPar" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="defaultGatewayDn field:">
          <el-input v-model="formData.defaultGatewayDn" clearable :placeholder="t('general.pleaseEnter')" />
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
  name: 'Services'
}
</script>

<script setup>
import {
  createServices,
  updateServices,
  findServices
} from '@/api/services'

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
        catId: 0,
        provId: 0,
        nameAr: '',
        nameEn: '',
        isPrice: 0,
        price: 0,
        inq: 0,
        count: 0,
        isPar: 0,
        defaultGatewayDn: '',
        })

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findServices({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.reservices
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
          res = await createServices(formData.value)
          break
        case 'update':
          res = await updateServices(formData.value)
          break
        default:
          res = await createServices(formData.value)
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
