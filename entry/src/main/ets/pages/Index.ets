import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

import {router} from '@kit.ArkUI'
import { when } from '@ohos/hamock';
import { it } from '@ohos/hypium';

function  getInstance():string{
  return  `First`
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private  contentList : Array<string> = ['异步任务','自定义UI',`自定义布局`,`Builder装饰器特性`]

  build() {
    List({space:`30`}){
      ForEach(this.contentList,(item:string)=>{
        ListItem() {
          Row({space:`30`}) {
            Text(item).fontSize(20).onClick((event)=>{
              switch (item){
                case "异步任务":

                  let context = getContext(this) as common.UIAbilityContext
                  let want:Want ={
                    deviceId:"",
                    bundleName:`com.example.myapplication`,
                    abilityName:`FuncAbility`,
                    parameters:{
                      fromWhere:`firstPage`
                    }
                  }
                  context.startAbility(want).then(()=>{
                    console.info(`start ability success `)
                  }).catch((err:BusinessError)=>{
                    console.error(`startAblity error is ${err} message is ${err.message}`)
                  })
                  break

                case "自定义UI":
                  router.pushUrl({url:'pages/PageTwo'})
                  break
                case "自定义布局":
                  router.pushUrl({url:`pages/CustomPage`})
                  break
                case `Builder装饰器特性`:
                  router.pushUrl({url:`pages/BuilderCharacterPage`})
                  break
              }



              console.info(`----onClick ${item}`)


            })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
        }
      }/*, (item: String) => JSON.stringify(item)*/)
    }.height(`100%`).width('100%').padding(`30`)

  }


}