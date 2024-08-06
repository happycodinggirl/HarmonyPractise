import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

function  getInstance():string{
  return  `First`
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private  contentList : Array<string> = ['异步任务','其他']

  build() {
    List({space:`30`}){
      ForEach(this.contentList,(item:string)=>{
        ListItem() {
          Row({space:`30`}) {
            Text(item).fontSize(20).onClick((event)=>{
              console.info(`----onClick ${item}`)
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

            })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
        }
      }/*, (item: String) => JSON.stringify(item)*/)
    }.height(`100%`).width('100%').padding(`30`)

  }


}