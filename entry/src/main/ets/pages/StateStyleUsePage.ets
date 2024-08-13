

@Entry
@Component
struct StateStyleUsePage {
  @State message: string = 'Hello World';

  @State bgColor:ResourceColor =Color.Red




  @Styles  normalStyle(){
    .backgroundColor(Color.Pink)
  }

  @Styles pressedStyle(){
    .backgroundColor(Color.Green)
  }

  build() {
    Column(){
      Button(`stateStyle`).stateStyles({
        pressed:this.pressedStyle,
        normal:this.normalStyle
      }).margin(20).width(50).height(50)

      Button(`button2`).stateStyles({pressed:{.backgroundColor(this.bgColor)},normal:{.backgroundColor(Color.Pink)}}).onClick((err)=>{
        this.bgColor=Color.Orange
      })
    }

  }
}