



@Component
export struct HelloComponent{
  @State message : string = "init"

  @State clickCount : number =0

  build() {
    Row(){
      Text(this.message).onClick(()=>{
        this.clickCount++
        if (this.clickCount>0) {
          this.message=`click count ${this.clickCount}`
        }
      }).backgroundColor(Color.Blue).fontColor(Color.White).textAlign(TextAlign.Center).width('100%').height(`20%`)

    }.width('100%').height('20%')
  }
}