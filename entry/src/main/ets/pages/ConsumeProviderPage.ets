

@Component
struct ConsumeLinkChild{
  @Consume @Watch('pageInfo') info:number
  pageInfo(){
    console.debug('ConsumeLinkChild pageInfo change is '+this.info)
  }
  build() {
    Column({space:20}){
      Text('consume link child '+this.info.toString()).fontSize(30).fontColor(Color.Red)
      Button('consume link child click to change info ').onClick(()=>{
        this.info +=1
      })
    }

  }
}

@Component
struct LinkLinkChild{
  @Link @Watch('pageInfo') info:number
  pageInfo(info:string){
    console.debug('LinkLinkChild pageInfo change is '+info)
  }
  build() {
    Column({space:20}){
      Text('link link child '+this.info.toString()).fontSize(30).fontColor(Color.Red)
      Button('link link child click to change info ').onClick(()=>{
        this.info +=1
      })
    }

  }
}

@Component
struct PropLinkChild{
  @Prop @Watch('pageInfo') info:number

  pageInfo(info:string){
    console.debug('PropLinkChild page info change is '+info)
  }

  build() {
    Column({space:20}){
      Text('propLinkChild info is '+this.info).fontSize(30).fontColor(Color.Blue)
      Button('PropLink child click to change info ').onClick(()=>{
        this.info +=1
      })
    }
  }
}

@Component
struct LinkChild{
  @Link @Watch('pageInfo') info:number
  pageInfo(info:string){
    console.debug('LinkChild pageInfo is '+info)
  }
  build() {
    Column({space:20}){
      LinkLinkChild({info:this.info})
      Text('LinkChild info is '+this.info)
      Button('change linkChild info').onClick(()=>{
        this.info +=1
      })
    }
  }
}


@Component
struct ConsumeChild{
  @Consume @Watch('pageInfo') info:number

  pageInfo(info:string){
    console.debug('ConsumeChild pageInfo : '+info)
  }

  build() {
    Column({space:20}){
      ConsumeLinkChild()
      Text('consumeChild info is '+this.info)
      Button('click to change consumeChild info').onClick(()=>{
        this.info +=1
      })
    }

  }
}






@Entry
@Component
struct ConsumeProviderPage {
  @Provide @Watch('pageInfo') info:number=100

  pageInfo(info:string){
    console.debug('ConsumeProviderPage pageInfo is '+info)
  }

  build() {
    Column({space:20}){
      LinkChild({info:this.info})
      ConsumeChild()
      ConsumeLinkChild()
      PropLinkChild()

      Text('Main entry info is '+this.info)
      Button('click to change info').onClick(()=>{
        this.info +=1
      })
    }

  }
}