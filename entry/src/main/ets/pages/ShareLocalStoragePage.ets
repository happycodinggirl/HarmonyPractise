import { router } from '@kit.ArkUI'


let localStorage =LocalStorage.getShared()
@Entry(localStorage)
@Component
struct ShareLocalStoragePage {
  @LocalStorageLink(`PropA`) propA:number =1



  build() {

    Column({space:20}){
      Text(`annother page PropA is ${this.propA}`)
      Button(`change PropA value to 1000`).onClick((err)=>{
        this.propA = 1000

      }).margin(20)
      Button(`back`).onClick((err)=>{

        router.back()

      })
    }

  }
}