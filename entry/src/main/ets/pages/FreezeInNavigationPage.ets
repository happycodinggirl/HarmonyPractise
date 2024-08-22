import { router } from '@kit.ArkUI'

@Component({freezeWhenInactive:true})
struct ContentShow{
  @Link @Watch('info') message:number

  @Link index:number

  info(){
    console.debug(`contentShow message is ${this.message} page index is ${this.index}`)

  }

  build() {
    Column(){
      Text(` contentShow message : ${this.message} page index : ${this.index}`).fontSize(30).fontColor(Color.Red)
    }
  }
}

@Component
struct StackPageOne{
  @Consume navi:NavPathStack
  @State index:number =1
  @Link message:number
  build() {
    NavDestination(){
      Column({space:20}){
        ContentShow({index:this.index,message:this.message})
        Text(`pageOne message is ${this.message} index is ${this.index}`)
        Button(`click to change `).onClick(()=>{
          this.message +=1

        })
        Button('click to nextPage').onClick(()=>{
          this.navi.pushPathByName('pageTwo',null)
        })
      }
    }.title('page'+this.index).onBackPressed(()=>{
      this.navi.pop()
      return true
    })

  }
}

@Component
struct StackPageTwo{
  @Consume navi:NavPathStack

  @State index:number=2
  @Link message:number
  build() {
    NavDestination(){
      Column({space:20}){
        ContentShow({index:this.index,message:this.message})
        Text(`pageTwo message is ${this.message} index is ${this.index}`)
        Button(`click to change `).onClick(()=>{
          this.message +=1

        })
        Button('click to nextPage').onClick(()=>{
          this.navi.pushPathByName('pageThree',null)
        })
      }
    }.title('page'+this.index).onBackPressed(()=>{
      this.navi.pop()
      return true
    })

  }
}

@Component
struct StackPageThree{
  @Consume navi:NavPathStack

  @State index:number=3
  @Link message:number
  build() {
    NavDestination(){
      Column({space:20}){
        ContentShow({index:this.index,message:this.message})
        Text(`pageThree message is ${this.message} index is ${this.index}`)
        Button(`click to change `).onClick(()=>{
          this.message +=1

        })
        Button('click to nextPage').onClick(()=>{
          this.navi.pushPathByName('pageOne',null)
        })
      }
    }.title('page '+this.index).onBackPressed(()=>{
      this.navi.pop()
      return true
    })

  }
}





@Entry
@Component
struct FreezeInNavigationPage {

  @Provide navi:NavPathStack = new NavPathStack()
  @State message:number =0
  @State index:number = 0


  @Builder
  pageMap(pageName:string){
  if (pageName==='pageOne'){
    StackPageOne({message:this.message})
  }else if (pageName==='pageTwo'){
    StackPageTwo({message:this.message})
  }else if (pageName==='pageThree'){
    StackPageThree({message:this.message})
  }
}

  build() {

    Column(){
      Button('change Message stack size : '+this.navi.size()).onClick(()=>{
          this.message +=1
      })
      Navigation(this.navi){
        Column(){
          Button(`Next page`).onClick((err)=>{
            //this.navi.pushPath({name:'pageOne'})
            this.navi.pushPathByName('pageOne',null)
          })
        }
      }.title('NaviIndex').navDestination(this.pageMap).mode(NavigationMode.Stack)
    }


  }
}