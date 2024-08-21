@Entry
@Component
struct OtherStatusPage {
  @State text:string = " "

  controller :TextInputController = new TextInputController()





  build() {
    Column({space:20}){
      Text(this.text)
      TextInput({text:$$this.text,placeholder:'input your content ...',controller:this.controller})//$$运算符是为系统内置组件提供TS变量的引用，使得TS变量和系统内置组件的内部状态保持一致
        //内部状态具体指什么取决于组件，例如，TextInput组件的text参数
        .placeholderColor(Color.Grey)
        .placeholderFont({size:14,weight:400})
        .caretColor(Color.Blue)
        .width(300)
    }.width('100%').height(`100%`).justifyContent(FlexAlign.Center)

  }
}