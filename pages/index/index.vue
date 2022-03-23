<template>
  <view class="home">
    <view class="text-area">
      <u-swiper :list="swiperList" keyName="bannerImg" height="250" autoplay indicator circular></u-swiper>
    </view>
    <view class="recommend"> 热卖推荐 </view>
    <GoodsCard :list="list" />
  </view>
</template>

<script>
import { getSwiper, getHotList } from '@/api'
import GoodsCard from '@/components/goodsCard/index'
export default {
  name: 'home',
  components: {
    GoodsCard
  },
  data() {
    return {
      list: [],
      swiperList: []
    }
  },
  onLoad() {
    this.getList()
    this.getSwiperList()
  },
  methods: {
    async getList() {
      const res = await getHotList({ type: 'isHot', value: 1 })
      this.list = res
    },
    async getSwiperList() {
      const res = await getSwiper()
      this.swiperList = res
    }
  }
}
</script>

<style lang='scss'>
.home {
  .recommend {
    width: 120px;
    height: 40px;
    background-color: #0c34ba;
    border-radius: 0 20px 0 0;
    line-height: 40px;
    text-align: center;
    color: #fff;
    margin-top: 20px;
    margin-left: 5px;
  }
}
</style>
