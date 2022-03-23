const seq = require('../db/seq')
const { DataTypes } = require('sequelize')
const Goods = require('./goods')
const Order = seq.define(
  'orders',
  {
    goods_id: DataTypes.STRING,
    user_id: DataTypes.STRING,
    cart_id: DataTypes.STRING,
    address_id: DataTypes.STRING,
    price: DataTypes.STRING,
    count: DataTypes.STRING,
    status: {
      type: DataTypes.STRING,
      defaultValue: 0
    },
    flag: DataTypes.STRING,
    order_no: DataTypes.STRING
  },
  { tableName: 'orders', timestamps: false }
)

// Order.sync({ force: true })
Order.belongsTo(Goods, { foreignKey: 'goods_id', otherKey: 'id' })

module.exports = Order
