<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" label-position="right" label-width="20%">
        <el-form-item label="doubleCheck field:">
          <el-input v-model="formData.doubleCheck" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="max field:">
          <el-input v-model.number="formData.max" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="min field:">
          <el-input v-model.number="formData.min" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameAr field:">
          <el-input v-model="formData.nameAr" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="nameEn field:">
          <el-input v-model="formData.nameEn" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="regex field:">
          <el-input v-model="formData.regex" clearable :placeholder="t('general.pleaseEnter')" />
        </el-form-item>
        <el-form-item label="required field:">
          <el-switch v-model="formData.required" active-color="#13ce66" inactive-color="#ff4949" :active-text="t('general.yes')" :inactive-text="t('general.no')" clearable ></el-switch>
        </el-form-item>
        <el-form-item label="typeId field:">
          <el-input v-model.number="formData.typeId" clearable :placeholder="t('general.pleaseEnter')" />
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
  name: 'Fields'
}
</script>

<script setup>
import {
  createFields,
  updateFields,
  findFields
} from '@/api/fields'

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
        doubleCheck: '',
        max: 0,
        min: 0,
        nameAr: '',
        nameEn: '',
        regex: '',
        required: false,
        typeId: 0,
        })

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findFields({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.refields
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
          res = await createFields(formData.value)
          break
        case 'update':
          res = await updateFields(formData.value)
          break
        default:
          res = await createFields(formData.value)
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
