<template>
  <view class="goods-card">
    <view
      v-for="item in list"
      :key="item.id"
      class="card-item"
      @click="toDetail(item.id)"
    >
      <u--image
        :showLoading="true"
        :src="item.largeImg"
        width="120px"
        height="120px"
        radius="5px"
      ></u--image>
      <view>{{ item.name }}</view>
      <view class="enname">
        <view class="cc">{{ item.enname }}</view>
      </view>
      <view>{{ item.price }}</view>
    </view>
  </view>
</template>

<script>
export default {
  name: 'goods-card',
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
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
  font-size: 14rpx;
  background-color: #f8f9f9;
  .card-item {
    margin-top: 20rpx;
    width: 46%;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    border-radius: 5px;
    padding: 10rpx;
    box-sizing: border-box;
    .cc {
      width: 120px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      color: #999999;
      padding: 10rpx 0;
    }
  }
}
</style>
