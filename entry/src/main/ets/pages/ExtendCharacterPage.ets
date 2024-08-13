

@Extend(Text) function childFancy(){
  .fontWeight(FontWeight.Bold)
}
// extend 装饰器只能用在 全局中，且可以有参数,且可以直接调用已有的
@Extend(Text) function  fancy(fontSize:number){
  .fontColor(Color.Red)
  .fontSize(fontSize)
  .childFancy()
}

@Entry
@Component
struct ExtendCharacterPage {
  @State message: string = 'Hello World';

  build() {
    Column({space:20}){
      Text(`fancy 20`).fancy(20)
      Text(`fancy 40`).fancy(40)
    }

  }
}