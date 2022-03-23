<template>
  <view class="bottom-nav">
    <view class="shopbar">
      <u-icon name="bag-fill" color="#0c34ba" size="24"></u-icon>
      <view class=""> 购物袋 </view>
    </view>

    <view class="collect">
      <u-icon name="heart-fill" size="24" color="#0c34ba"></u-icon>
      <view class=""> 已收藏 </view>
    </view>
    <view class="right">
      <view class="add-cart" @click="addCart"> 加入购物车 </view>
      <view class="buy" @click="goShop"> 立即购买 </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {}
  },
  methods: {
    addCart() {
      this.$emit('addCart')
    },
    goShop() {
      this.$emit('goShop')
    }
  }
}
</script>

<style lang="scss" scoped>
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  height: 80rpx;
  width: 100%;
  background-color: #fff;
  display: flex;
  justify-content: space-between;
  font-size: 24rpx;

  .shopbar {
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 120rpx;
  }

  .collect {
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 120rpx;
  }

  .right {
    flex: 1;
    display: flex;
    box-sizing: border-box;
    color: #fff;
    font-size: 30rpx;
    border-radius: 40rpx;
    overflow: hidden;
    margin: 10rpx;
    .add-cart {
      background-color: #6a91ec;
      flex: 1;
      text-align: center;
      line-height: 60rpx;
    }

    .buy {
      flex: 1;
      background-color: #0c34ba;
      text-align: center;
      line-height: 60rpx;
    }
  }
}
</style>
