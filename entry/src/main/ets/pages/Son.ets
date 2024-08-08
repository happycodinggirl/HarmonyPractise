@Entry
@Component
export struct Son {
  sonSubmit?:()=>void


  @Builder doSomeRender(){
    Text(this.calculateString())
  }

  calculateString(){
    return 'i am from calculate'
  }

  build() {
    Row(){
      Button(){
        Text("i am from son").fontColor(Color.White)
      }.onClick((event)=>{
        if (this.sonSubmit) {
          this.sonSubmit()
        }
      }).width('50%')
      this.doSomeRender()
    }.width('100%').height('40%').justifyContent(FlexAlign.Center)//使button 居中对齐
  }
}