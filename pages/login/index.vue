<template>
  <view class="wrap">
    <view class="top"></view>
    <view class="content">
      <input class="u-border-bottom" v-model="username" placeholder="请输入账号" />
      <input class="u-border-bottom" type="password" v-model="password" placeholder="请输入密码" />
      <u-button type="primary" style="margin-top: 10px" @click="submit"> 登录 </u-button>
      <view class="alternative">
        <view class="password">找回密码</view>

        <view class="issue" @click="$u.route({ url: '/pages/login/register' })"> 注册 </view>
      </view>
    </view>
  </view>
</template>

<script>
import { login } from '@/api'
export default {
  data() {
    return {
      username: 'admin', // 邮箱
      password: '123123' // 密码
    }
  },
  methods: {
    async submit() {
      const res = await login({
        username: this.username,
        password: this.password
      })
      uni.setStorageSync('token', res.token)
      uni.setStorageSync('userInfo', JSON.stringify(res.user_info))

      // 跳转到页面
      const path = getCurrentPages().pop().options.redirect
      this.$u.route({
        type: 'reLaunch',
        url: path ? path : 'pages/index/index'
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.u-border-bottom {
  margin-bottom: 40rpx !important;
}

.wrap {
  font-size: 28rpx;

  .content {
    width: 600rpx;
    margin: 80rpx auto 0;

    .title {
      text-align: left;
      font-size: 60rpx;
      font-weight: 500;
      margin-bottom: 100rpx;
    }

    input {
      text-align: left;
      margin-bottom: 10rpx;
      padding-bottom: 6rpx;
    }

    .tips {
      color: #ccc;
      margin-bottom: 60rpx;
      margin-top: 8rpx;
    }

    .alternative {
      color: #ccc;
      display: flex;
      justify-content: space-between;
      margin-top: 30rpx;
    }
  }
}
</style>

