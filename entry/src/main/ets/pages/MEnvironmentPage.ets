
Environment.envProp('languageCode','en')//将设备的语言code存入AppStorage中，默认值为en


@Entry
@Component
struct MEnvironmentPage {
  //使用StorageProp 链接到Component中
  @StorageProp('languageCode') languageCode:string='en'

  build() {
    Column(){
      Text(`languageCode is ${this.languageCode}`)
    }

  }
}