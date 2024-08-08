import {router} from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import { HelloComponent } from './CustomView';
import { Parent } from './Parent';

@Entry
@Component
struct PageTwo {


  @State message: string = 'Hello World';

  @State showTopText:boolean = true


  private  context= getContext(this) as common.UIAbilityContext

  eventHubEvent():void{
    this.context.eventHub.emit("event1")
    this.context.eventHub.emit("event1","one param")
    this.context.eventHub.emit("event1","one param","two param")
  }

  onDidBuild(): void {
  console.info(`onDidBuild`)
  }

  aboutToAppear(): void {
  console.info(`about to appear`)
  }

  aboutToDisappear(): void {
  console.info(`about to disappear`)
  }
  onPageShow(): void {
    console.info(`onPageShow`)
  }

  onPageHide(): void {
    console.info(`onPagehide`)
  }
  onBackPress(): boolean | void {
      console.info(`on back press`)
  }






  build() {


    Row(){
      Column({space:20}){
        if (this.showTopText){

          Text(this.message).fontSize(50).fontWeight(FontWeight.Bold)
        }
        Button(){
          Text("Back").fontSize(25).fontWeight(FontWeight.Normal)
        }.type(ButtonType.Capsule).margin({top:28}).backgroundColor("#ff00ff").width('40%').height('5%').onClick(()=>{
          console.info('success in click back button')
          this.showTopText=!this.showTopText
          this.eventHubEvent()

          try {
          //  router.back()
          } catch (e) {
            let code = (e as BusinessError).code
            let message = (e as BusinessError).message
            console.error(` back error code is ${code} message is ${message}`)
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)

          }
        })
        if (this.showTopText){
          HelloComponent({message:"showCount"})

          HelloComponent()

        }


        Parent().width('100%')
      }
    }
  }
}


