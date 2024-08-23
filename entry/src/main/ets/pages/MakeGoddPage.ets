
@Observed
class Translate{
  translateX:number = 20
}

@Component
struct Title{

  build() {
    Row(){
      Image($r('app.media.startIcon')).width(50).height(50)
      Text('Title').fontSize(20)
    }
  }
}



@Entry
@Component
struct MakeGoddPage {
  @State translateObj: Translate = new Translate();

  build() {
    Column(){
      Title()
      Stack(){

      }.width(200).height(400).backgroundColor("black")
      Button(`Move`).onClick(()=>{
        animateTo({duration:50},()=>{
            this.translateObj.translateX =(this.translateObj.translateX+50)%150
        })
      })
    }.translate({x:this.translateObj.translateX})

  }
}