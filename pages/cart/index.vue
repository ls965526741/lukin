<template>
  <view class="cart">
    <view v-for="item in list" :key="item.id">
      <view class="cart-item">
        <view class="left">
          <!-- <u-checkbox-group
            v-model="list"
            placement="column"
            @change="checkboxChange"
          >
            <u-checkbox :customStyle="{ marginBottom: '8px' }"> </u-checkbox>
          </u-checkbox-group> -->
        </view>
        <u--image :src="item.smallImg" width="100px" height="100px" mode="aspectFit" radius="10px"></u--image>
        <view class="right">
          <view class="title">{{ item.name }}</view>
          <view>
            <text v-for="(item1, index) in item.attr.split(',')" :key="index" class="attr">{{ item1 }}</text>
          </view>
          <view class="price">
            <text>价格:￥{{ item.price }}</text>
            <view class="number-box">
              <view class="number-btn number-sub" @click="editNumber(item, 'sub')">-</view>
              <view class="number">{{ item.number }}</view>
              <view class="number-btn number-add" @click="editNumber(item, 'add')">+</view>
            </view>
            <u-icon size="18px" color="red" @click="removeGoods(item.goods_id)" name="trash"></u-icon>
          </view>
        </view>
      </view>
    </view>

    <view class="foot">
      <view class="foot-left">
        <checkbox></checkbox>
        <text class="left-text">全选</text>
      </view>
      <view class="foot-right">
        <text class="right-text">合计:</text>
        <view class="foot-price">
          <text class="one-price">￥</text>
          <text class="two-price">{{ allPrice }}</text>
        </view>
        <button type="default" class="btn" @click="addOrder">提交订单</button>
      </view>
    </view>
    <u-modal
      :show="show"
      content="你还没有登录,点击确定进入登录页面"
      @confirm="toLogin"
      width="250"
      @cancel="show = false"
      showCancelButton
    ></u-modal>
  </view>
</template>

<script>
import { getCart, editCart, removeCart, addOrder } from '@/api'
export default {
  name: 'cart',
  data() {
    return {
      list: [],
      checked: false,
      show: false
    }
  },
  onShow() {
    this.list = []
    const token = uni.getStorageSync('token')
    token ? this.getList() : ''
  },
  onLoad() {
    const token = uni.getStorageSync('token')
    token ? this.getList() : (this.show = true)
  },
  methods: {
    async getList() {
      const res = await getCart()
      this.list = res.map(item => ({ ...item, ...item.good }))
      // .map((item) => {
      //   item.selected = !!item.selected
      //   return item
      // })
      console.log(this.list)
    },
    valChange(item) {
      cartsNum(item.id, { num: item.num })
    },
    async removeGoods(goods_id) {
      await removeCart({ goods_id })
      await this.getList()
      this.$u.toast('删除成功')
    },
    async editNumber(item, type) {
      const { goods_id, number } = item
      if (parseInt(number) === 0 && type === 'sub') return
      const newNumber = type === 'add' ? number * 1 + 1 : number * 1 - 1
      const res = await editCart({ goods_id, number: newNumber })
      if (res) {
        item.number = newNumber
      }
    },
    async addOrder() {
      const params = []
      this.list.forEach(item => {
        const arr = {}
        arr.goods_id = item.goods_id
        arr.price = item.price
        arr.count = item.number
        params.push(arr)
      })
      const res = await addOrder(params)
    }
  },
  computed: {
    allPrice() {
      const all = this.list.reduce((a, b) => {
        return b.selected ? parseInt(b.price) * parseInt(b.number) + a : a
      }, 0)
      return all.toFixed(2)
    }
  }
}
</script>

<style lang="scss" scoped>
.cart {
  background-color: #f8f9f9;
  padding: 20rpx;
  height: calc(100vh - 94px);
  box-sizing: border-box;
  overflow-y: scroll;
  .cart-item {
    display: flex;
    align-items: center;
    border-radius: 10rpx;
    background-color: #fff;
    margin-bottom: 20rpx;
    padding: 10rpx;

    .left {
      padding-left: 10rpx;
    }

    .right {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
      padding-left: 20rpx;
      .title {
        padding-bottom: 10rpx;
      }
      .attr {
        height: 30rpx;
        font-size: 24rpx;
        background-color: #0c34ba;
        color: #fff;
        border-radius: 10rpx;
        padding: 0 10rpx;
        margin-right: 10rpx;
      }
      .price {
        display: flex;
        justify-content: space-around;
        align-items: center;
        padding-top: 10rpx;
        .number-box {
          display: flex;
          .number {
            padding: 0 20rpx;
          }

          .number-btn {
            width: 40rpx;
            height: 40rpx;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28rpx;
            line-height: 40rpx;
          }
          .number-sub {
            border: 1rpx solid #b8c3eb;
            color: #b8c3eb;
          }
          .number-add {
            color: #fff;
            background-color: #0c34ba;
          }
        }
        text {
          width: 140rpx;
          font-size: 24rpx;
        }
      }
    }
  }
  .foot {
    position: fixed;
    bottom: 120rpx;
    width: 100%;
    // border: 2rpx solid;
    padding: 0 30rpx;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .foot-left {
      display: flex;
      align-items: center;
    }
    .foot-right {
      display: flex;
      align-items: center;

      .foot-price {
        margin: 0 30rpx;

        .two-price {
          font-size: 36rpx;
        }
      }
      .btn {
        width: 280rpx;
        height: 80rpx;
        color: #fff;
        font-size: 34rpx;
        border-radius: 80rpx;
        background-color: #0c34ba;
        line-height: 80rpx;
        text-align: center;
      }
    }
  }
}
</style>
