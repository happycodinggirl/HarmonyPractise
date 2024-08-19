import { router } from '@kit.ArkUI';

let storage = LocalStorage.getShared()


@Component
struct ChildLocalStroage {
  @LocalStorageLink('PropA') link1:number=10 //@LocalStoragePro变量装饰器和LocalStorage中的PropA建立单向绑定关系
  build() {
    Column(){
      Button(`child link1 is ${this.link1}`).onClick((err)=>{//单击只会改变当前组件显示的link1，不会同步到LocalStorage 中
        this.link1+=1

      })
    }
  }
}






@Entry(storage)
@Component
struct LocalStoragePage {


  @LocalStorageLink('PropA') link2:number=2


  build() {
    Column(){

      Button(`entry PropA is ${this.link2}`).onClick((err)=>{
        this.link2+=2

      }).margin(20)

      Button(`set PropA value increase by 10 `).onClick((err)=>{
        let localPropA=storage.get<number>(`PropA`)
        if (localPropA !=undefined) {
          storage.set<number>('PropA',10 + localPropA )
        }

      }).margin(20)
      ChildLocalStroage().margin(20)

      Button(`jump to annother page`).onClick((err)=>{
        router.pushUrl({url:`pages/ShareLocalStoragePage`})
      })


    }
  }
}