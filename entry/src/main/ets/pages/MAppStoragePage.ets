import { emitter } from '@kit.BasicServicesKit';

let NextId: number = 0

class ViewData {
  title: string;
  uri: Resource;
  color: Color = Color.Black;
  id: number;

  constructor(title: string, uri: Resource) {
    this.title = title
    this.uri = uri

    this.id = NextId++
  }
}

@Entry
@Component
struct Gallery2 {
  dataList: Array<ViewData> = [new ViewData('zfb', $r('app.media.pay_zfb')), new ViewData('wx', $r('app.media.pay_wx'))
    , new ViewData('gold', $r('app.media.pay_gold')), new ViewData('coupons', $r('app.media.pay_coupons'))]
  scroller = new Scroller()
  private preIndex: number = -1

  @State selectedIndex :number =-1

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.dataList, (item: ViewData) => {
          GridItem() {
            TapImage({
              uri:item.uri,
              index:item.id,
            })
          }.aspectRatio(1).onClick(() => {

            if (this.preIndex === item.id) {
              return
            }

            let  innerEvent:emitter.InnerEvent = {eventId:item.id }
            let eventData:emitter.EventData ={
              data:{
                "colorTag":1
              }
            }
            emitter.emit(innerEvent,eventData)
            this.preIndex=item.id


          }

          )

        },(item:ViewData)=>JSON.stringify(item))
      }.columnsTemplate('1fr 1fr')
    }

  }
}

@Component
export struct TapImage {
  @State tapColor: Color = Color.Black
  private index: number = 0



  private uri: Resource = {
    id: 0,
    type: 0,
    moduleName: "",
    bundleName: ""
  }

  onTapIndexChanged(colorTag:emitter.EventData){
    if (colorTag.data != null) {
      this.tapColor=colorTag.data.colorTag?Color.Red:Color.Black
    }
  }

  aboutToAppear(): void {
   let innerEvent:emitter.InnerEvent ={eventId:this.index}
    emitter.on(innerEvent,data=>{
        this.onTapIndexChanged(data)
    })

  }

  build() {
    Column() {
      Image(this.uri).objectFit(ImageFit.Cover).border({ width: 5, style: BorderStyle.Dotted, color:  this.tapColor })

    }
  }
}