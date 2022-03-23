<template>
  <view class="order" v-if="list.length">
    <view v-for="item in list" :key="item.id">
      <view class="order-item">
        <u--image :src="item.good.smallImg" width="100px" height="100px" mode="aspectFit" radius="10px"></u--image>
        <view class="right">
          <view class="title">{{ item.good.name }}</view>
          <view class="price"> 价格:￥{{ item.price }} </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import { getOrder, updateOrder } from '@/api'
export default {
  data() {
    return {
      list: []
    }
  },
  onLoad() {
    this.getList()
  },
  methods: {
    async getList() {
      const res = await getOrder()
      this.list = res.rows
      console.log(this.list)
    }
  }
}
</script>

<style lang="scss" scoped>
.order {
  background-color: #f8f9f9;
  padding: 20rpx;
  box-sizing: border-box;
  height: 100vh;
  overflow-y: scroll;
  .order-item {
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
      .price {
        font-size: 24rpx;
      }
    }
  }
}
</style>
