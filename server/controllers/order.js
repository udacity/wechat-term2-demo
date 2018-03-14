const DB = require('../utils/db.js')

module.exports = {
  /**
   * 创建订单
   * 
   */

  add: async ctx => {
    let user = ctx.state.$wxInfo.userinfo.openId
    let productList = ctx.request.body.list || []

    // 插入订单至 order_user 表
    let order = await DB.query('insert into order_user(user) values (?)', [user])

    // 插入订单至 order_product 表
    let orderId = order.insertId
    let sql = 'INSERT INTO order_product (order_id, product_id, count) VALUES '

    // 插入时所需要的数据和参数
    let query = []
    let param = []

    productList.forEach(product => {
      query.push('(?, ?, ?)')

      param.push(orderId)
      param.push(product.id)
      param.push(product.count || 1)

    })

    await DB.query(sql + query.join(', '), param)

    ctx.state.data = {}

  }

}