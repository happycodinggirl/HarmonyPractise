
let storage = new LocalStorage();
@Component
struct ChildLocalStroage {
  @LocalStorageLink('PropA') link1:number=1
  build() {
    Column(){
      Button(`child link1 is ${this.link1}`).onClick((err)=>{
        this.link1 +=1
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
      })
      ChildLocalStroage()
    }
  }
}