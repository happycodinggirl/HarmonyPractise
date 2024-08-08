



@Component
export struct HelloComponent{
  @State message : string = "init"

  @State clickCount : number =0

  aboutToAppear(): void {
    console.log(`customView -----------------------------about to Appear`)
  }

  aboutToDisappear(): void {
    console.log(`customView------------------------------------about to disappear`)
  }

  onBackPress(): boolean | void {
    console.log( `customView =============================================onBaCKpREWESS`)
  }

  onDidBuild(): void {
    console.log(`---------------------customView----onDidBuild--------------------`)
  }

  onPageShow(): void {//只有有装饰器@Entry 的页面的onPageShow ,onPageHide 才会走到，除了这两个方法之外的其他生命周期方法还是可以走到的
    console.log(`-------------------------customView ----------------------onPageShow----------------------`)
  }

  onPageHide(): void {//只有有装饰器@Entry 的页面的onPageHide 才会  起效果
    console.info(`---------------------------------customView-----------------onPageHIDE---------------------`)
  }

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