const { DataTypes } = require('sequelize')
const seq = require('../db/seq')
const UserInfo = require('./userInfo')
const User = seq.define(
  'carts',
  {
    goods_id: DataTypes.STRING,
    user_id: DataTypes.STRING,
    number: DataTypes.STRING,
    selected: DataTypes.STRING,
    attr: DataTypes.STRING
  },
  { tableName: 'carts', timestamps: false }
)
// 关联数据库
// User.UserInfo = User.belongsTo(UserInfo, { foreignKey: 'id', otherKey: 'id' })

// 强制同步数据库(创建数据表)
// User.sync({ force: true })

module.exports = User
