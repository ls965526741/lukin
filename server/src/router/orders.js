const Router = require('koa-router')
const Order = require('../modules/orders')
const Goods = require('../modules/goods')
const Carts = require('../modules/carts')
const router = new Router({ prefix: '/order' })
const { auth } = require('../middleware/auth')

const removeCarts = async () => {}

const findAll = async (ctx) => {
  const { id } = ctx.state.user
  const res = await Order.findAndCountAll({
    where: { user_id: id },
    include: {
      model: Goods
    }
  })
  // 3. 返回结果
  ctx.body = {
    code: 200,
    message: '获取商品列表成功',
    result: res
  }
}
const create = async (ctx) => {
  const order = ctx.request.body
  const user_id = ctx.state.user.id
  order.forEach((item) => {
    item.user_id = user_id
  })
  await Order.bulkCreate(order)
  ctx.body = {
    code: 200,
    message: '添加商品订单成功'
  }
}

const update = async (ctx) => {
  const { id, ...status } = ctx.request.body
  await Order.update({ status }, { where: { id } })
}

// -----------------------end-----------------------------

// 获取订单列表
router.get('/', auth, findAll)

// 提交订单
router.post('/', auth, create)

// 更新订单状态
router.put('/:id', auth, update)

module.exports = router
