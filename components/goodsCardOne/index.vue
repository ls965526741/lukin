<template>
  <view class="goods-card">
    <view
      v-for="item in list"
      :key="item.id"
      class="card-item"
      @click="toDetail(item.id)"
    >
      <u--image :src="item.smallImg" width="80px" height="80px"></u--image>
      <view class="center">
        <view>{{ item.name }}</view>
        <view class="enname">{{ item.enname }}</view>
      </view>
      <view class="card-left"
        ><view>￥{{ item.price }}</view></view
      >
    </view>
  </view>
</template>

<script>
export default {
  props: ['list'],
  data() {
    return {}
  },
  methods: {
    toDetail(id) {
      uni.navigateTo({
        url: `../detail/index?id=${id}`
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.goods-card {
  .card-item {
    margin: 20rpx;
    border-radius: 20rpx;
    display: flex;
    background-color: #fff;
    overflow: hidden;

    .center {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;
      padding-left: 10rpx;
      box-sizing: border-box;
      .enname {
        width: 150px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
    }
    .card-left {
      display: flex;
      align-items: center;
      justify-content: center;
      padding-right: 10rpx;
    }
  }
}
</style>
