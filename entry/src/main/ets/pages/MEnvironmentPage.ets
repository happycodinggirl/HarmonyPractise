
Environment.envProp('languageCode','en')


@Entry
@Component
struct MEnvironmentPage {

  @StorageProp('languageCode') languageCode:string='en'

  build() {
    Column(){
      Text(`languageCode is ${this.languageCode}`)
    }

  }
}