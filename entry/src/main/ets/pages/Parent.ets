import {Son} from './Son'

@Entry
@Component
export struct Parent {

  @State ckt:number=0

  submit:()=>void =()=>{
      this.ckt++
    console.info(`parent submit invoke ckt is ${this.ckt}`)
  }

  build() {

    Column(){
      Text('i am parent').align(Alignment.Top|Alignment.Center)
      Son({sonSubmit:this.submit}).width(`100%`).height(`50%`).backgroundColor(Color.Green)

    }.width('100%').height('20%')

  }
}