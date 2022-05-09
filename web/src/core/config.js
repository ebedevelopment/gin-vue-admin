/**
 * Site configuration file
 */

const config = {
  appName: 'Wakty-Admin',
  appLogo: 'https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/67583495_2489771101258266_6444045364709294080_n.jpg?_nc_cat=111&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=zcZhJGI2MY0AX8NIoG8&_nc_ht=scontent.fcai19-4.fna&oh=00_AT9I8JMlyUkOuGlJSMjZ2nInraxdVrHzy1VHGCfFiG5Z5A&oe=629DFE78',
  showViteLogo: true
}

export const viteLogo = (env) => {
  if (config.showViteLogo) {
    const chalk = require('chalk')
    console.log(
      chalk.green(
        `> Welcome to use Gin - Vue - Admin, open source address：https://github.com/flipped-aurora/gin-vue-admin`
      )
    )
    console.log(
      chalk.green(
        `> The current version:V2.5.0`
      )
    )
    console.log(
      chalk.green(
        `> Add group way: WeChat：shouzi_1994 QQ Group of：622360840`
      )
    )
    console.log(
      chalk.green(
        `> GVA discuss community：https://support.qq.com/products/371961`
      )
    )
    console.log(
      chalk.green(
        `> Automated document address by default:http://127.0.0.1:${env.VITE_SERVER_PORT}/swagger/index.html`
      )
    )
    console.log(
      chalk.green(
        `> Automated document address by default:http://127.0.0.1:${env.VITE_SERVER_PORT}/swagger/index.html`
      )
    )
    console.log(
      chalk.green(
        `> Front end file operation address by default:http://127.0.0.1:${env.VITE_CLI_PORT}`
      )
    )
    console.log(
      chalk.green(
        `> If the project is to let you get the profits, hope you can team for a cup of coke, please:https://www.github.com/flipped-aurora/gin-vue-admin/server.com/docs/coffee`
      )
    )
    console.log('\n')
  }
}

export default config
