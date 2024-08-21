

class TrackClass{
  @Track str1:string ="hello"
  @Track str2:string = "world"

  constructor(str1: string) {
    this.str1=str1
  }


}

class NoTrackClass{
  str1:string = '你好'
  str2:string = '世界'

  constructor(str1:string) {
    this.str1 = str1
  }



}

@Extend(Text)
function fancyText(){
  .fontColor(Color.Blue).fontWeight(FontWeight.Medium)

}

class Log{
  @Track loginInfo:string
  owner:string
  time:Date

  constructor(loginInfo:string) {
    this.loginInfo = loginInfo
    this.owner="owner"
    this.time = new Date()
  }
}


@Entry
@Component
struct TrackPage {
  @State trackClass:TrackClass = new TrackClass("hello")

  @State noTrackClass:NoTrackClass = new NoTrackClass("你好")

  @State mLog:Log=new Log("loginInfo")

  isRender(num:number):number{
    console.info(` isRender num is ${num}`)
    return 30
  }




  build() {
    Column({space:20}){
      Text(this.trackClass.str1).fontSize(this.isRender(1)).fancyText()
      Text(this.trackClass.str2).fontSize(this.isRender(2)).fancyText()
      Button(`click to change trackClass str1`).onClick((err)=>{//改变@Track 修饰符装饰的变量 只会引发 使用该变量的组件的刷新，只刷新track str1Text，显示track str2组件的text 不刷新
        console.info('click to change trackclass str1')
        this.trackClass.str1='Bye'
      })
      Text(this.noTrackClass.str1).fontSize(this.isRender(3)).fancyText()
      Text(this.noTrackClass.str2).fontSize(this.isRender(4)).fancyText()
      Button(`click to change no Track class str`).onClick((err)=>{
        console.info('click to change notrackclass str1')
        this.noTrackClass.str1 = '再见'//改变没有被@Track 装饰符修饰的变量，除了 noTrackClass str1 刷新，noTrackClass str2 的Text 也会刷新
      })
      Text(this.mLog.loginInfo).fontSize(this.isRender(5)).fancyText()

      Button(`click to change no Track class str`).onClick((err)=>{
        console.log('owner: ' + this.mLog.owner +
          ' loginfo: ' + this.mLog.loginInfo +
          ' time: ' + this.mLog.time )
       this.mLog.loginInfo +=' info'
      })


    }

  }
}