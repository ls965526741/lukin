<template>
  <view class="menu">
    <view class="menu-bar">
      <view v-for="item in menuList" :key="item.id" @click="onBarClick(item.type)" class="bar-item">
        <view>
          <u--image v-if="current !== item.type" :src="item.url" width="40px" height="40px"></u--image>
          <u--image v-else :src="item.activeUrl" width="40px" height="40px"></u--image>
        </view>
        <view>{{ item.typeDesc }}</view>
      </view>
    </view>
    <GoodsCard :list="goodsList" />
  </view>
</template>

<script>
import { getMenu, getHotList } from '@/api'
import GoodsCard from '@/components/goodsCardOne'
export default {
  name: 'goods-menu',
  components: {
    GoodsCard
  },
  data() {
    return {
      menuList: [
        {
          url: '../../static/images/icons_09.gif',
          activeUrl: '../../static/images/icons_21.gif'
        },
        {
          url: '../../static/images/icons_03.gif',
          activeUrl: '../../static/images/icons_18.gif'
        },
        {
          url: '../../static/images/icons_05.gif',
          activeUrl: '../../static/images/icons_19.gif'
        },
        {
          url: '../../static/images/icons_07.gif',
          activeUrl: '../../static/images/icons_20.gif'
        },
        {
          url: '../../static/images/icons_11.gif',
          activeUrl: '../../static/images/icons_22.png'
        }
      ],
      goodsList: [],
      current: 'isHot'
    }
  },
  onLoad() {
    this.getMenu()
    this.getList()
  },
  methods: {
    async getMenu() {
      const res = await getMenu()
      const defaultval = { type: 'isHot', typeDesc: '推荐', id: 0 }
      const obj = [defaultval, ...res]
      const arr = []
      obj.forEach((item, index) => {
        arr.push({ ...this.menuList[index], ...obj[index] })
      })
      this.menuList = arr
    },
    async getList() {
      const params = this.current === 'isHot' ? { type: 'isHot', value: '1' } : { type: 'type', value: this.current }
      this.goodsList = await getHotList(params)
    },
    onBarClick(type) {
      this.current = type
      this.goodsList = []
      this.getList()
    }
  }
}
</script>

<style lang="scss" scoped>
.menu {
  background-color: #f8f9f9;
  height: calc(100vh - 96px);
  overflow-y: scroll;
  .menu-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24rpx;
    background-color: #fbfbfb;
    .bar-item {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
  }
}
</style>

