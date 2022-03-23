const { DataTypes } = require('sequelize')
const seq = require('../db/seq')
const UserInfo = require('./userInfo')
const User = seq.define(
  'goods',
  {
    pid: DataTypes.STRING,
    type: DataTypes.STRING,
    name: DataTypes.STRING,
    price: DataTypes.STRING,
    desc: DataTypes.STRING,
    smallImg: DataTypes.STRING,
    largeImg: DataTypes.STRING,
    typeDesc: DataTypes.STRING,
    isHot: DataTypes.STRING,
    tem: DataTypes.STRING,
    tem_desc: DataTypes.STRING,
    milk: DataTypes.STRING,
    milk_desc: DataTypes.STRING,
    sugar: DataTypes.STRING,
    sugar_desc: DataTypes.STRING,
    cream_desc: DataTypes.STRING,
    enname: DataTypes.STRING,
    createdAt: DataTypes.STRING,
    updatedAt: DataTypes.STRING
  },
  { tableName: 'goods', timestamps: false }
)
// 关联数据库
User.UserInfo = User.belongsTo(UserInfo, { foreignKey: 'id', otherKey: 'id' })

// 强制同步数据库(创建数据表)
// User.sync({ force: true })

module.exports = User
