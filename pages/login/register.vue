<template>
  <view style="padding: 0 5px">
    <u--form
      labelPosition="left"
      :model="model"
      :rules="rules"
      labelWidth="80"
      ref="refForm"
    >
      <u-form-item label="昵称" prop="username" borderBottom ref="item1">
        <u--input v-model="model.username" border="none"></u--input>
      </u-form-item>
      <u-form-item label="密码" prop="password" borderBottom ref="item1">
        <u--input
          v-model="model.password"
          type="password"
          border="none"
        ></u--input>
      </u-form-item>
    </u--form>
    <u-button type="primary" style="margin-top: 10px" @click="submit"
      >提交</u-button
    >
    <u-modal
      :show="show"
      title="提示"
      content="点击确定跳转到登陆页面"
      showCancelButton
      @confirm="$u.route({ type: 'reLaunch', url: '/pages/login/index' })"
      @cancel="show = false"
    ></u-modal>
  </view>
</template>

<script>
import { register } from '@/api'
export default {
  data() {
    return {
      show: false,
      model: {
        username: 'admin',
        password: '123123'
      },
      rules: {
        username: [
          {
            required: true,
            message: '用户名必填',
            // blur和change事件触发检验
            trigger: ['blur']
          },
          {
            pattern: /^[a-zA-Z][a-zA-Z0-9]{4,16}$/,
            message: '数字或字母',
            trigger: ['blur']
          }
        ],
        password: [
          {
            required: true,
            message: '密码必填',
            // blur和change事件触发检验
            trigger: ['blur']
          },
          {
            pattern: /^[0-9a-zA-Z]{6,16}$/,
            message: '密码必须为数字或字母',
            trigger: ['blur']
          }
        ]
      }
    }
  },
  methods: {
    async submit() {
      const res = await this.$refs.refForm.validate()
      if (res) {
        await register(this.model)
        this.show = true
      }
    }
  }
}
</script>

<style>
</style>
