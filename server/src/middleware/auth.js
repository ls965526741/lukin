const jwt = require('jsonwebtoken')

const JWT_SECRET = 'xzd'

// TOKEN验证
const auth = async (ctx, next) => {
  const { authorization = '' } = ctx.request.header
  const token = authorization.replace('Bearer ', '')
  try {
    const user = jwt.verify(token, JWT_SECRET)
    ctx.state.user = user
  } catch (err) {
    switch (err.name) {
      case 'TokenExpiredError':
        return (ctx.body = {
          code: 400,
          message: 'token已过期'
        })
      case 'JsonWebTokenError':
        return (ctx.body = {
          code: 400,
          message: '无效的token'
        })
    }
  }
  await next()
}

// 生成token info 为生成的token的类容 比如id username
const generateToken = function (info) {
  return jwt.sign(info, JWT_SECRET, { expiresIn: '1d' })
}

module.exports = {
  auth,
  generateToken
}
