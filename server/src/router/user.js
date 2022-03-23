const Router = require('koa-router')
const router = new Router({ prefix: '/users' })
const User = require('../modules/user')
const UserInfo = require('../modules/userInfo')
const { cryptPassword, decryptPassword } = require('../middleware/crypt')
const { auth, generateToken } = require('../middleware/auth')

const path = require('path')

const register = async ctx => {
  const { username, password } = ctx.request.body
  const res = await User.count({ where: { username } })
  if (res === 0) {
    const res = await User.create({ username, password })
    await UserInfo.create({ user_id: res.dataValues.id })
    ctx.body = {
      code: 200,
      message: '用户创建成功'
    }
  } else {
    ctx.throw(400, '用户名已经存在')
  }
}

const getUerInfo = async ctx => {
  const where = {}
  const { id, username, email, password } = ctx.request.body
  id && Object.assign(where, { id })
  username && Object.assign(where, { username })
  email && Object.assign(where, { email })

  const res = await User.findOne({
    attributes: ['id', 'username', 'password'],
    where
  })
  // 密码对比
  const comparePwd = decryptPassword(password + '', res.dataValues.password)
  if (comparePwd) {
    const user_info = await UserInfo.findOne({
      where: { user_id: res.dataValues.id }
    })
    ctx.body = {
      code: 200,
      message: '登陆成功',
      result: {
        token: generateToken(res.dataValues),
        user_info
      }
    }
  } else {
    ctx.throw(400, '登陆失败')
  }
}

const updateById = async ctx => {
  const { id } = ctx.state.user
  const password = ctx.request.body
  const [res] = await User.update(password, { where: { id } })
  if (res) {
    ctx.body = {
      code: 200,
      message: '修改成功'
    }
  } else {
    ctx.throw(400, '修改失败')
  }
}
const upload = async (ctx, next) => {
  console.log(ctx.request.files)
  const { file } = ctx.request.files
  const fileTypes = ['image/jpeg', 'image/png']
  if (file) {
    if (!fileTypes.includes(file.type)) {
      ctx.throw(400, '上传文件格式不正确')
    }
    ctx.body = {
      code: 200,
      message: '商品图片上传成功',
      result: {
        img: `img/${path.basename(file.path)}`
      }
    }
  } else {
    ctx.throw(400, '上传文件为空')
  }
}

// 注册接口
router.post('/register', cryptPassword, register)

// 修改密码接口
router.patch('/', auth, cryptPassword, updateById)

// // 登录接口
router.post('/login', getUerInfo)

// 上传
router.post('/upload', upload)

module.exports = router
