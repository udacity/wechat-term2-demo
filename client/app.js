//app.js
var qcloud = require('./vendor/wafer2-client-sdk/index')
var config = require('./config')

let userInfo

App({
    onLaunch: function () {
        qcloud.setLoginUrl(config.service.loginUrl)
    },

    login({success, error}) {
      qcloud.login({
        success: result => {
          if (result) {
            userInfo = result

            success && success({
              userInfo
            })
          } else {
            // 如果不是首次登录，不会返回用户信息，请求用户信息接口获取
            this.getUserInfo({ success, error })
          }
        },
        fail: () => {
          error && error()
        }
      })
    },

    getUserInfo({ success, error }){
      if (userInfo) return userInfo

      qcloud.request({
        url: config.service.user,
        login: true,
        success: result => {
          let data = result.data

          if (!data.code){
            userInfo = data.data

            success && success({
              userInfo
            })
          } else {
            error && error()
          }
        },
        fail: () => {
          error && error()
        }
      })
    },



})