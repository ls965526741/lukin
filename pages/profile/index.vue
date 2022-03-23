<template>
  <view>
    <view class="my">
      <u-upload :fileList="fileList" @afterRead="afterRead" :maxCount="1" width="0" height="0" style="flex: none">
        <u--image
          class="user-img"
          :src="userInfo.user_img ? `http://localhost:8888/${userInfo.user_img}` : ''"
          shape="circle"
          width="80"
          height="80"
        ></u--image>
      </u-upload>
      <view v-if="Object.keys(userInfo).length">{{ userInfo.nickname }}</view>
      <view v-else class="is-login">
        <navigator url="/pages/login/index?redirect=pages/profile/index">登陆</navigator>
        <view class="empty">|</view>
        <navigator url="/pages/login/register">注册</navigator>
      </view>
    </view>
    <u-cell-group>
      <u-cell icon="setting-fill" size="large" title="个人信息" isLink @click="show = true"></u-cell>
      <u-cell icon="rmb-circle" size="large" title="所有订单" isLink @click="$u.route('pages/order/index')"></u-cell>
      <u-cell icon="star" size="large" title="商品收藏" isLink @click="$u.toast('待开发')"></u-cell>
      <u-cell icon="map" size="large" title="收货地址" isLink @click="$u.toast('待开发')"></u-cell>
      <u-cell icon="reload" size="large" title="退出登录" isLink @click="showLogout = true"></u-cell>
    </u-cell-group>

    <!-- 个人信息操作框 -->
    <u-popup :show="show" @close="show = false" mode="bottom" closeable safeAreaInsetBottom>
      <view class="user-dialog">
        <u--form labelPosition="left" :model="userInfo">
          <u-form-item label="姓名" prop="userInfo.nickname" borderBottom ref="item1">
            <u--input v-model="userInfo.nickname" border="none"></u--input>
          </u-form-item>
        </u--form>
        <u-button type="primary" text="确定" @click="updateUserName"></u-button>
      </view>
    </u-popup>
    <!-- 退出提示框 -->
    <u-modal
      :show="showLogout"
      title="退出"
      content="点击确定后退出登陆"
      showCancelButton
      @confirm="logout"
      @cancel="showLogout = false"
    ></u-modal>
  </view>
</template>

<script>
import { upload, updateUserInfo } from '@/api'
export default {
  data() {
    return {
      userInfo: {},
      fileList: [],
      show: false,
      showLogout: false
    }
  },
  methods: {
    logout() {
      uni.clearStorageSync()
      this.userInfo = {}
      this.showLogout = false
    },
    // 图片上传
    async afterRead(event) {
      // console.log(event.file)
      // const formData = new FormData('file', event.file)
      // uni.uploadFile({
      //   url: 'http://localhost:8888/users/upload', //仅为示例，非真实的接口地址
      //   files: formData,
      //   fileType: event.file,
      //   success: uploadFileRes => {
      //     console.log(uploadFileRes.data)
      //   }
      // })
      // const res = await upload({ file: list[0].url })
      // this.userInfo.avatar_url = list[0].url
      // const res = await userUpdateAvatar({ avatar: list[0].url })
    },
    async updateUserName() {
      const res = await updateUserInfo({ nickname: this.userInfo.nickname })
      if (res) {
        uni.setStorageSync('userInfo', JSON.stringify(res))
      }

      this.show = false
    }
  },
  onLoad() {
    const userInfo = uni.getStorageSync('userInfo')
    this.userInfo = userInfo ? JSON.parse(userInfo) : {}
  }
}
</script>

<style lang='scss'>
.my {
  display: flex;
  align-items: center;
  .user-img {
    padding: 10rpx;
  }
  .is-login {
    display: flex;
    padding-left: 10rpx;
    .empty {
      padding: 0 10rpx;
    }
  }

  .name {
    padding-left: 20rpx;

    :first-child {
      padding: 10rpx 0;
    }

    :last-child {
      color: #ccc;
    }
  }
}

.user-dialog {
  .u-button {
    margin-bottom: 100rpx;
  }
}
</style>
