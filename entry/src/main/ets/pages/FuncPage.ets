import { common } from '@kit.AbilityKit'
import { fileIo } from '@kit.CoreFileKit'
import { BusinessError } from '@kit.BasicServicesKit'

async  function  myAsyncFunction():Promise<string>{
  const result:string = await new Promise((resolve:Function)=>{
    setTimeout(()=>{
      resolve(`hello world`)
    },3000)
  })
  return result
}


async  function  writeFileFunction():Promise<boolean>{
  let context = getContext() as common.UIAbilityContext
  let filePath=context.filesDir+"/test.txt"
  let file=await fileIo.open(filePath,fileIo.OpenMode.READ_WRITE|fileIo.OpenMode.CREATE)
  write("hello world",file).then(()=>{
    console.info(`success in writing file `)
  }).catch((err:BusinessError)=>{
    console.error(`error in write file is ${err.message}`)
    fileIo.close(file)
  })

  let result =await fileIo.access(filePath,fileIo.AccessModeType.READ_WRITE)
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
        let result= await writeFileFunction()
        console.info(`-----asyncfunction res is ${result}`)
      }).width(`50%`).height(`20%`)
    }.width(`100%`).height(`100%`).backgroundColor(Color.Red).padding({top:40})

  }
}

async function write(arg0: string, file: fileIo.File) {
  fileIo.write(file.fd,arg0).then((fileLength:number)=>{
    console.log("----write file success---")
  }).catch((err:BusinessError)=>{
    console.error(`write file error is ${err.message}`)
  })
}
