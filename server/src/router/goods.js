const Router = require('koa-router')
const router = new Router({ prefix: '/goods' })
const Goods = require('../modules/goods')
const findGoods = async ctx => {
  const { type, value } = ctx.query
  const res = await Goods.findAll({ where: { [type]: value } })
  ctx.body = {
    code: 200,
    message: '获取成功',
    result: res
  }
}
const findOne = async ctx => {
  const { id } = ctx.params
  const res = await Goods.findOne({ where: { id } })
  ctx.body = {
    code: 200,
    message: '获取成功',
    result: res
  }
}
router.get('/', findGoods)
router.get('/:id', findOne)
module.exports = router
