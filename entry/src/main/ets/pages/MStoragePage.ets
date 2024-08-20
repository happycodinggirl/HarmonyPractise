

let storage1= new LocalStorage()
let storage2 = new LocalStorage()
let storage3 = new LocalStorage()

storage1.setOrCreate(`ST1`,`ST1`)
storage2.setOrCreate('ST2','ST2')
storage3.setOrCreate('st3','st3')





@Entry
@Component
struct MStoragePage {
  @Provide('pageInfo') pageInfo:NavPathStack = new NavPathStack()

  @Builder
  PageMap(name:string){
    if (name=='pageOne'){
        PageOne({},storage1)
    }else if (name == 'pageTwo'){
      PageTwo({},storage2)
    }else if (name =='pageThree'){
      PageThree({},storage3)

    }
  }

  build() {
    Navigation(this.pageInfo){
      Column(){
        Button('next page',{stateEffect:true,type:ButtonType.Capsule}).onClick((err)=>{
          this.pageInfo.pushPathByName('pageOne',null)
        })

      }
    }.title('navInde').navDestination(this.PageMap).mode(NavigationMode.Stack)


  }
}

@Component
struct PageOne{
  @Consume('pageInfo') navStack:NavPathStack
  @LocalStorageProp('ST1') st1:string ="st1"


  build() {
    NavDestination(){
      Column({space:10}){
        NavigationContentText()
        Text(`pageOne st1 is ${this.st1}`)
        Button('into pageTwo').onClick((err)=>{
          this.navStack.pushPathByName('pageTwo',null)
        })
      }

    }.title('pageOne').onBackPressed(() => {
      this.navStack.pop();
      return true;
    })

  }
}

@Component
struct PageTwo{
  @Consume('pageInfo') navStack:NavPathStack
  @LocalStorageLink('ST2') st2:string='st2'

  build() {
    NavDestination(){
      Column({space:10}){
        NavigationContentText()
        Text(`pageTwo st2 is ${this.st2}`)
        Button('into pageThree').onClick((err)=>{
          this.navStack.pushPathByName('pageThree',null)
        })
      }

    }.title('pageTwo').onBackPressed(()=>{
      this.navStack.pop()
      return true
    })

  }
}

@Component
struct PageThree{
  @Consume('pageInfo') navStack:NavPathStack

  @LocalStorageLink('ST3')st3:string = 'st3'

  build() {
    NavDestination(){
      Column({space:20}){
        NavigationContentText()
        Text(`pageThree st3 is ${this.st3}`)

        Button('into pageThree',{stateEffect:true,type:ButtonType.Capsule}).onClick((err)=>{
          this.navStack.pushPathByName('pageOne',null)
        })

      }
    }.title('pageThree').onBackPressed(()=>{
      this.navStack.pop()
      return true
    })

  }
}



@Component
struct NavigationContentText{

  @LocalStorageProp('ST1') st1:string="helllo"

  build() {
    Column(){
      Text(`${this.st1}`).margin(20)

    }
  }
}

