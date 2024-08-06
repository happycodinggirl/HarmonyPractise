import { common } from '@kit.AbilityKit'

async  function  myAsyncFunction():Promise<string>{
  const result:string = await new Promise((resolve:Function)=>{
    setTimeout(()=>{
      resolve(`hello world`)
    },3000)
  })

  return result
}

@Entry
@Component
struct FuncPage {
  @State message:string="before"
  build() {
    Column(){
      Text(this.message).align(Alignment.Center)
      Button(){
        Text(`press here to back`)
      }.onClick(async ()=>{
        this.message= await myAsyncFunction()
        console.info(`-----asyncfunction res is ${this.message}`)
      }).width(`50%`).height(`20%`)
    }.width(`100%`).height(`100%`)

  }
}