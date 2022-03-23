const Router = require('koa-router')
const { Op } = require('sequelize')
const router = new Router({ prefix: '/cart' })
const Carts = require('../modules/carts')
// 关联数据库
const Goods = require('../modules/goods')
Carts.belongsTo(Goods, { foreignKey: 'goods_id', otherKey: 'id' })
const { auth } = require('../middleware/auth')

const findCarts = async (ctx) => {
  const id = ctx.state.user.id
  const res = await Carts.findAll({
    where: { user_id: id },
    include: {
      model: Goods
    }
  })
  ctx.body = {
    code: 200,
    message: '获取成功',
    result: res
  }
}
const createCarts = async (ctx) => {
  const id = ctx.state.user.id
  const params = ctx.request.body
  const res = await Carts.findOne({
    where: {
      [Op.and]: { user_id: id, goods_id: params.goods_id }
    }
  })
  if (res) {
    await Carts.update({ ...params, user_id: id }, { where: { user_id: id } })
  } else {
    await Carts.create({ ...params, user_id: id })
  }
  ctx.body = {
    code: 200,
    message: '获取成功'
  }
}

// 修改购物车
const edit = async (ctx) => {
  const user_id = ctx.state.user.id
  const { goods_id, ...agrs } = ctx.request.body
  const [res] = await Carts.update(agrs, { where: { user_id, goods_id } })
  // 3. 返回结果
  if (res === 1) {
    ctx.body = {
      code: 200,
      message: '修改成功'
    }
  } else {
    ctx.body = {
      code: 400,
      message: '修改失败'
    }
  }
}

// 删除购物车
const remove = async (ctx) => {
  const user_id = ctx.state.user.id
  const { goods_id } = ctx.request.body
  const res = await Carts.destroy({ where: { user_id, goods_id } })
  if (res === 1) {
    ctx.body = {
      code: 200,
      message: '删除成功'
    }
  } else {
    ctx.body = {
      code: 400,
      message: '删除失败'
    }
  }
}

// 全选
const selectAll = async (ctx) => {
  const user_id = ctx.state.user.id
  const { selected } = ctx.request.body
  await Carts.update({ selected }, { where: { user_id } })
  ctx.body = {
    code: 200,
    message: '添加成功'
  }
}

router.get('/', auth, findCarts)
router.post('/', auth, createCarts)
router.put('/', auth, edit)
router.post('/remove', auth, remove)
router.post('/selectAll', auth, selectAll)

module.exports = router
