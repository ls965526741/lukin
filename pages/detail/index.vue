<template>
  <view class="detail">
    <image class="img" :src="list.largeImg" mode="widthFix"></image>
    <view class="container">
      <view class="detail-name">
        <view>
          <view class="name">{{ list.name }}</view>
          <view class="enname">{{ list.enname }}</view>
        </view>
        <view class="price">￥{{ list.price }}</view>
      </view>
      <view class="detail-attr">
        <view v-for="item in list.attr" :key="item.id" class="attr-item">
          <view class="attr-name">{{ item.name }}</view>
          <view class="attr-item">
            <view
              v-for="(item1, index1) in item.attr"
              :key="index1"
              class="attr-value"
              :class="item.actived === item1 ? 'attr-actived' : 'attr-deactived'"
              @click="item.actived = item1"
            >
              {{ item1 }}
            </view>
          </view>
        </view>
      </view>
      <view class="detail-count">
        <view>选择数量</view>
        <view class="number-box">
          <view class="number-btn number-sub" @click="sub">-</view>
          <view class="number">{{ goodsNumber }}</view>
          <view class="number-btn number-add" @click="add">+</view>
        </view>
      </view>
      <view class="detail-desc">
        <view> 商品描述 </view>
        <view>
          <view v-for="(item, index) in list.desc" :key="index" class="desc"> {{ index }}, {{ item }} </view>
        </view>
      </view>
    </view>
    <GoodsAction @addCart="addCart" @goShop="goShop" />
    <u-modal
      :show="isLoginModal"
      :title="title"
      :content="content"
      @confirm="toLogin"
      @cancel="isLoginModal = false"
      showCancelButton
    ></u-modal>
    <u-toast ref="uToast"></u-toast>
  </view>
</template>

<script>
import { getDetail, addCart } from '@/api'
import GoodsAction from '@/components/goodsAction'
export default {
  name: 'detail',
  components: {
    GoodsAction
  },
  data() {
    return {
      list: {},
      goodsNumber: 1,
      isLoginModal: false,
      title: '你还没有登陆',
      content: '点击确认将跳转去登陆'
    }
  },
  onLoad(option) {
    this.getList(option.id)
  },
  methods: {
    async getList(id) {
      const res = await getDetail(id)
      const attrArr = ['sugar', 'tem', 'milk']
      res.desc = res.desc.split('\n')
      const attr = []
      attrArr.map(item => {
        if (res[item]) {
          attr.push({
            name: res[`${item}_desc`],
            attr: res[item].split('/'),
            actived: res[item].split('/')[0]
          })
        }
      })
      res.attr = attr
      this.list = res
    },
    sub() {
      if (parseInt(this.goodsNumber) === 0) return
      this.goodsNumber--
    },
    add() {
      this.goodsNumber++
    },
    async addCart() {
      const params = {
        goods_id: this.list.id,
        number: this.goodsNumber,
        selected: 1,
        attr: this.list.attr.map(item => item.actived).join(',')
      }
      const token = uni.getStorageSync('token')
      if (token) {
        const res = await addCart(params)
        if (res) {
          this.$refs.uToast.show({
            message: '加入购物车成功'
          })
        }
      } else {
        this.isLoginModal = true
      }
    },
    async goShop() {
      console.log('待开发')
    },
    toLogin() {
      this.isLoginModal = false
      uni.$u.route({
        type: 'navigateTo',
        url: 'pages/login/index',
        params: {
          redirect: `pages/detail/index?id=${this.list.id}`
        }
      })
    }
  }
}
</script>

<style lang="scss">
.detail {
  width: 100%;
  .img {
    width: 100%;
  }
  .container {
    background-color: #fff;
    border-radius: 20rpx;
    padding: 20rpx;

    .detail-name {
      display: flex;
      justify-content: space-between;
      .name {
        font-size: 36rpx;
        color: #646566;
      }
      .enname {
        color: #999999;
      }
      .price {
        color: #0c34ba;
      }
    }
    .detail-attr {
      padding: 20rpx 0;
      .attr-item {
        display: flex;
        align-items: center;
        .attr-name {
          width: 160rpx;
        }
        .attr-item {
          display: flex;
          .attr-value {
            padding: 10rpx 30rpx;
            border-radius: 30rpx;
            margin-right: 10rpx;
            margin-top: 10rpx;
          }
          .attr-actived {
            background-color: #0c34ba;
            color: #fff;
          }
          .attr-deactived {
            background-color: #e8e8e8;
            color: #646566;
          }
        }
      }
    }
    .detail-count {
      display: flex;
      justify-content: space-between;
      border-top: 1rpx solid #737674;
      border-bottom: 1rpx solid #737674;
      padding: 30rpx 0;
      .number-box {
        display: flex;
        .number {
          padding: 0 20rpx;
        }

        .number-btn {
          width: 40rpx;
          height: 40rpx;
          border-radius: 50%;
          line-height: 40rpx;
          text-align: center;
        }
        .number-sub {
          border: 1px solid #b8c3eb;
          color: #b8c3eb;
        }
        .number-add {
          color: #fff;
          background-color: #0c34ba;
        }
      }
    }
    .detail-desc {
      color: #9fa19f;
      padding: 20rpx 0;
      .desc {
        padding-top: 20rpx;
      }
    }
  }
}
</style>
