const seq = require('../db/seq')
const { DataTypes } = require('sequelize')
const UserInfo = seq.define(
  'user_info',
  {
    user_id: DataTypes.STRING,
    user_img: {
      type: DataTypes.STRING,
      defaultValue: 'img/ed3e5493045d980e29c648b3aa83b6ce.png'
    },
    birthday: DataTypes.STRING,
    gender: DataTypes.STRING,
    nickname: DataTypes.STRING,
    personalized: DataTypes.STRING
  },
  { tableName: 'userinfo', timestamps: false }
)

// 强制同步数据库(创建数据表)
// UserInfo.sync({ force: true })

module.exports = UserInfo
