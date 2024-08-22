@Component
struct LinkLinkLChild{

  @LocalStorageLink('testNum') @Watch('onTestChange') testNum:number=0

  onTestChange(){
    console.debug('-----LinkLinkChild onTestChange testNum is  '+this.testNum)
  }


  build() {
    Column({space:20}){
      Text('LinkLinkChild testNum : '+this.testNum.toString()).fontSize(30).fontColor(Color.Brown)
      Button(`click to change testNum`).onClick(()=>{
        this.testNum +=1
      })
    }
  }
}

@Component
struct LinkPropLChild{
  @LocalStorageProp('testNum') @Watch('onTestChange') testNum:number =0

  onTestChange(){
    console.debug(' LinkPropChild onTestChange testNum is '+this.testNum)
  }


  build() {
    Column({space:20}){
      Text('LinkPropChild testNum : '+this.testNum.toString()).fontSize(30).fontColor(Color.Brown)
      Button(`click to change testNum`).onClick(()=>{
        this.testNum +=1
      })
    }

  }
}
@Component
struct LinkLChild{
  @LocalStorageLink('testNum') @Watch('onTestChange') testNum:number =0

  onTestChange(){
    console.debug(' LinkChild onTestChange testNum is '+this.testNum)
  }

  build() {
    Column({space:20}){
      Text('LinkChild testNum is '+this.testNum).fontSize(30).fontColor(Color.Green).margin(20)
      Button('click to change testNum ').onClick(()=>{
        this.testNum +=1
      })
      LinkLinkLChild()
      LinkPropLChild()

    }
  }
}





@Entry
@Component
struct LocalStorageLinkPage {
  @StorageLink('testNum') @Watch('onTestChange') testNum:number =0

  onTestChange(){
    console.debug('main entry LocalStorageLinkPage  onTestChange testNum is '+this.testNum)
  }


  build() {
    Column(){
      LinkLChild()

    }

  }
}