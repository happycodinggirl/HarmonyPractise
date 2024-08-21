import router from '@ohos.router';

@Entry
@Component({freezeWhenInactive:false})
struct FreezeTestPage {
  @State message: string = 'Hello World';

  @StorageLink('PropA') @Watch('second') secondNum:number =2

  second(){
    console.debug(` secondNum is ${this.secondNum}`)

  }

  build() {
   Column({space:20}){
     Text(`secondNum is ${this.secondNum}`)
     Button(`click to increase secondNum`).onClick((err)=>{
       this.secondNum+=1
     })
     Button('click to exit').onClick((err)=>{
       router.back()
     })
   }
  }
}