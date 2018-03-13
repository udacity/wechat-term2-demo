const mysql = require('mysql')
const config = require('../config').mysql

var pool = null

/**
 * 初始化连接池
 */
function initMysqlPool() {
  pool = mysql.createPool({
    connectionLimit: 50,
    database: config.db,
    host: config.host,
    port: config.port,
    user: config.user,
    password: config.pass
  });
}

module.exports = {
  /**
   * 执行sql查询
   */
  query(sql, sqlParam, connection) {
    // 打印sql语句
    return new Promise((resolve, reject) => {
      if (connection) {
        connection.query(sql, sqlParam, (err, rows) => {
          if (err) {
            reject(err)
          } else {
            resolve(rows)
          }
        })
      } else {
        if (!pool) {
          initMysqlPool()
        }

        pool.getConnection((err, connection) => {
          if (err) {
            reject(err)
          } else {
            connection.query(sql, sqlParam, (err, rows) => {
              connection.release()
              if (err) {
                reject(err)
              } else {
                resolve(rows)
              }
            })
          }
        })
      }
    })
  },
}
