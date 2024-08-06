import {router} from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct PageTwo {
  @State message: string = 'Hello World';


  private  context= getContext(this) as common.UIAbilityContext

  eventHubEvent():void{
    this.context.eventHub.emit("event1")
    this.context.eventHub.emit("event1","one param")
    this.context.eventHub.emit("event1","one param","two param")
  }



  build() {


    Row(){
      Column(){
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold)
        Button(){
          Text("Back").fontSize(25).fontWeight(FontWeight.Normal)
        }.type(ButtonType.Capsule).margin({top:28}).backgroundColor("#ff00ff").width('40%').height('5%').onClick(()=>{
          console.info('success in click back button')

          this.eventHubEvent()

          try {
            router.back()
          } catch (e) {
            let code = (e as BusinessError).code
            let message = (e as BusinessError).message
            console.error(` back error code is ${code} message is ${message}`)
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)

          }


        })
      }
    }
  }
}