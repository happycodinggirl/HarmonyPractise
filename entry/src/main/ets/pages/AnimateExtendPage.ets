

@AnimatableExtend(Text)
function animateWidth(value:number){
  .width(value)
}



@Entry
@Component
struct AnimateExtendPage {
  @State message: string = 'Hello World';

  @State mwidth:number=100
  build() {

    Column(){
      Text(`PropertyAnimation`).animateWidth(this.mwidth).animation({
        duration:1000,curve:Curve.Ease
      })
      Button(`click to start animation`).onClick((err)=>{
        this.mwidth= this.mwidth==100? 50:100
      })
    }

  }
}