import router from '@ohos.router'


@Entry
@Component({freezeWhenInactive:false})
struct InfreezePage {
  @StorageLink('PropA') @Watch('first') firstNum:number=10

  first(){
    console.log(`first is ${this.firstNum}`)//当freezeWhenInactive 为true时，当此页面不可见但未销毁，
    // firstNum同步变量，改方法不会被调用到，而当freezeWhenInactive 为true，该方法不会被回调到，只有active时候才可以被回调
  }


  build() {
    Column({space:20}){
      Text(`firstPage first is ${this.firstNum}`)

      Button('increase first Page').onClick((err)=>{
        this.firstNum +=1
      })
      Button(`jump to annother page`).onClick((err)=>{
        router.pushUrl({url:'pages/FreezeTestPage'})
      })

    }
  }
}