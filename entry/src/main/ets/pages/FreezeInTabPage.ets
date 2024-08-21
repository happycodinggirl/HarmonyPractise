


@Component({freezeWhenInactive:true})
struct FreezeChild{
  @Link @Watch('onMessageChange') message:number
  index:number = 0

  onMessageChange(){
    console.info(`child onMessageChange message is ${this.message} index is ${this.index}`)
  }


  build() {

    Column({space:20}){
      Text(`child message is ${this.message} index is ${this.index}`)
      Button(`onClick to change message `).onClick((err)=>{
        console.debug('to changeMessage')
        this.message +=1
      })
    }

  }
}

@Entry
@Component
struct FreezeInTabPage {
  @State @Watch('onMessageChange') message:number=0
  tabs:number[]=[1,2]

  onMessageChange(){
      console.debug(`message change is ${this.message}`)
  }



  build() {
    Column(){
      Text(`parent message is ${this.message}`)
      Tabs(){
        ForEach(this.tabs,(item:number)=>{
          TabContent(){
            FreezeChild({message:this.message,index:item})
          }.tabBar(`tab${item}`)
        },(item:number)=>item.toString())
      }
    }

  }
}


