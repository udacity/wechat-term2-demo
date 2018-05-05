/**
 * 小程序配置文件
 */

// 此处主机域名修改成腾讯云解决方案分配的域名
var host = 'https://ty1qcd36.qcloud.la';

var config = {

    // 下面的地址配合云端 Demo 工作
    service: {
        host,

        // 登录地址，用于建立会话
        loginUrl: `${host}/weapp/login`,

        // 测试的请求地址，用于测试会话
        requestUrl: `${host}/weapp/user`,

        // 测试的信道服务地址
        tunnelUrl: `${host}/weapp/tunnel`,

        // 上传图片接口
        uploadUrl: `${host}/weapp/upload`,

        // 拉取商品列表
        productList: `${host}/weapp/product`,

        // 拉取商品详情
        productDetail: `${host}/weapp/product/`,

        // 拉取用户信息
        user: `${host}/weapp/user`,

        // 创建订单
        addOrder: `${host}/weapp/order`,

        // 获取已购买订单列表
        orderList: `${host}/weapp/order`,

        // 添加到购物车商品列表
        addTrolley: `${host}/weapp/trolley`,

        // 获取购物车商品列表
        trolleyList: `${host}/weapp/trolley`,

        // 更新购物车商品列表
        updateTrolley: `${host}/weapp/trolley`,

        // 添加评论
        addComment: `${host}/weapp/comment`,
        
        // 获取评论列表
        commentList: `${host}/weapp/comment`,

    }
};

module.exports = config;
