const DB = require('../utils/db')

module.exports = {

  /**
   * 添加评论
   */
  add: async ctx => {
    let user = ctx.state.$wxInfo.userinfo.openId
    let username = ctx.state.$wxInfo.userinfo.nickName
    let avatar = ctx.state.$wxInfo.userinfo.avatarUrl
    
    let productId = +ctx.request.body.product_id
    let content = ctx.request.body.content || null

    if (!isNaN(productId)) {
      await DB.query('INSERT INTO comment(user, username, avatar, content,  product_id) VALUES (?, ?, ?, ?, ?)', [user, username, avatar, content, productId])
    }

    ctx.state.data = {}
  }
}