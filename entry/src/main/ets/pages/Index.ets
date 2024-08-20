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
  private  contentList : Array<string> = ['异步任务','自定义UI',`自定义布局`,
    `Builder装饰器特性`,`Builder装饰器特性续集`,`Build参数来源`,
    `Build尾随闭包函数`,`wrapBuilder`,`Styles装饰器`,`Extend装饰器使用`,`StateStyle使用`,
    `AnimatableExtend使用`,`Required使用`,`State属性`,`State属性1`,`PropState使用`, `Link参数使用`,`Consume使用`
    ,`Consume override 使用`,`ObjectLink使用`,`多层嵌套组件ObjectLink使用`,`官方Link使用例子`,`LocalStorage使用`,'LocalStorage使用1']

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
               case `Builder装饰器特性续集`:
                  router.pushUrl({url:'pages/BuiderCharacter1'})
                  break

                case `Build参数来源` :
                  router.pushUrl({url:'pages/BuilderParamPage'})
                  break
                case `Build尾随闭包函数`:
                  router.pushUrl({url:`pages/BuilderPage2`})
                  break

                case `wrapBuilder`:
                  router.pushUrl({url:`pages/WapBuilderPage`})
                  break

                case `Styles装饰器`:
                  router.pushUrl({url:`pages/StyleUsePage`})
                  break

                case `Extend装饰器使用`:
                  router.pushUrl({url:`pages/ExtendCharacterPage`})
                  break
                case `StateStyle使用`:
                  router.pushUrl({url:`pages/StateStyleUsePage`})
                  break
                case `AnimatableExtend使用`:
                  router.pushUrl({url :`pages/AnimateExtendPage`})
                  break

                case `Required使用`:
                  router.pushUrl({url:'pages/RequiredPage'})
                  break
                case `State属性`:
                  router.pushUrl({url:`pages/StatePage`})
                  break

                case `State属性1`:
                  router.pushUrl({url:`pages/StatePage1`})
                  break
                case `PropState使用`:
                  router.pushUrl({url:'pages/PropStatePage'})
                  break

                case `Link参数使用`:
                  router.pushUrl({url:`pages/LinkPage`})
                  break
                case `Consume使用`:
                  router.pushUrl({url:`pages/ConsumePage`})
                  break

                case `Consume override 使用`:
                  router.pushUrl({url:'pages/ConsumeInsertPage'})
                  break
                case `ObjectLink使用`:
                  router.pushUrl({url :`pages/ObjectLinkPage`})
                  break

                case `多层嵌套组件ObjectLink使用`:
                  router.pushUrl({url:`pages/LinkPage1`})
                  break
                case `官方Link使用例子`:
                  router.pushUrl({url:`pages/OfficialLinkPage`})
                  break
                case `LocalStorage使用`:
                  router.pushUrl({url:`pages/LocalStoragePage`})
                  break

                case `LocalStorage使用1`:
                  router.pushUrl({url:'pages/CLStoragePage'})
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