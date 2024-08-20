
let localStorage1:LocalStorage = new LocalStorage()
let localStorage2:LocalStorage = new LocalStorage()
localStorage1.setOrCreate('St1','ST1')
localStorage2.setOrCreate('st2','st2')


@Entry(localStorage1)
@Component
struct CLStoragePage {
  @State message: string = 'Hello World';
  @LocalStorageLink('St1')st1:string='hello world'
  build() {
      Column({space:20}){
        Text(`st1 is ${this.st1}`)
        Button('click to change str1 to new value').onClick((err)=>{
          this.st1='new value'
        })
        CLSChild({},localStorage2)
      }
  }
}

@Component
struct CLSChild{
  @LocalStorageLink('st2')st2:string="i am st2"
  build() {
    Column({space:20}){
      Text(`st2 value is ${this.st2}`)
      Button('click to change value').onClick((err)=>{
        this.st2='changed st2'
      })
    }
  }
}