const path = require('path')
const Koa = require('koa')
const cors = require('koa-cors')
const app = new Koa()

app.use(cors())
// koabody配置项
const KoaBody = require('koa-body')
app.use(
  KoaBody({
    multipart: true,
    formidable: {
      uploadDir: path.join(__dirname, './upload'),
      keepExtensions: true
    },
    parsedMethods: ['POST', 'PUT', 'PATCH', 'DELETE']
  })
)
// 静态资源设置
const KoaStatic = require('koa-static')
app.use(KoaStatic(path.join(__dirname, './upload')))
app.use(KoaStatic(path.join(__dirname, './static')))

const parameter = require('koa-parameter')
app.use(parameter(app))

// 错误处理 必须在路由配置之前
const error = require('koa-json-error')
app.use(
  error({
    format: (err) => {
      const { status, message, stack } = err
      return { code: status, message, result: stack }
    },
    // 生产环境取消堆栈信息返回给前端
    postFormat: (err, obj) => {
      const { result, ...args } = obj
      return process.env.NODE_ENV === 'production' ? args : obj
    }
  })
)

// 路由配置
const router = require('./router')
app.use(router.routes()).use(router.allowedMethods())

app.listen(8888, () => {
  console.log('server is running on http://localhost:8888')
})
