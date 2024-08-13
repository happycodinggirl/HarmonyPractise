import {MyBottonModifier} from './MyAttibuteModifier'
@Styles function  globalFancy(){
  .height(50).backgroundColor(Color.Pink).width(50)
}



@Entry
@Component
struct StyleUsePage {
  @State message: string = 'Hello World';
  @State myBottonModifier:MyBottonModifier = new MyBottonModifier()

  @Styles
  localFancy(){
    .width(100).height(100).backgroundColor(Color.Blue)
  }

  build() {
    Column(){
      Text(`fancy style`).globalFancy()

      Line().height(49)
      Text('local fancy').localFancy()
      Line().height(30)

      Button(`i am button`).attributeModifier(this.myBottonModifier).onClick((err)=>{
        this.myBottonModifier.isDark= !this.myBottonModifier.isDark
      })
    }

  }
}