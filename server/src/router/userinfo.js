const Router = require('koa-router')
const router = new Router({ prefix: '/userinfo' })
const { auth } = require('../middleware/auth')
const updateUserInfo = async ctx => {
  const { id } = ctx.state.user
  const content = ctx.request.body
  const res = await UserInfo.update(content, { where: { user_id: id } })
  if (res) {
    const result = await UserInfo.findOne({ where: { user_id: id } })
    ctx.body = {
      code: 200,
      message: '修改成功',
      result
    }
  } else {
    ctx.throw(400, '修改失败')
  }
}
router.post('/userInfo', auth, updateUserInfo)
module.exports = router
