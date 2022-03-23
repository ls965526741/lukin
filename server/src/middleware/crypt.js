const bcrypt = require('bcryptjs')

// 加密密码
const cryptPassword = async (ctx, next) => {
  const password = ctx.request.body.password + ''

  const salt = bcrypt.genSaltSync(10)
  // hash保存的是 密文
  const hash = bcrypt.hashSync(password, salt)
  ctx.request.body.password = hash
  await next()
}
// 验证密码 pwd未加密 cpwd为以加密
const decryptPassword = function (pwd, cpwd) {
  return bcrypt.compareSync(pwd, cpwd)
}
module.exports = {
  cryptPassword,
  decryptPassword
}
