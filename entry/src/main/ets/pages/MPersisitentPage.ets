
PersistentStorage.persistProp('PD1',100) //注意再调用PersistentStorage.persisProp之前访问AppStorage中的属性是错误的，因为这样的调用顺序会丢失上次应用程序运行中的属性



@Entry
@Component
struct MPersisitentPage {
  @State message: string = 'Hello World';
  @StorageLink('PD1')pd1:number=22


  build() {
    Column(){
      Text(`pd1 is ${this.pd1}`).margin(20)
      Button(`click to change pd1 `).onClick((err)=>{
        this.pd1 = 3333
      })

    }
  }
}