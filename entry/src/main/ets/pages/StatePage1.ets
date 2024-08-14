

class PayDetail{
  backgroundValue ='#00ff00'

  changeBackValue(payDetail:PayDetail){//这种写法是正确的
    payDetail.backgroundValue=`#ff0000`
  }
}

export class Model{
  callback:()=>void

  constructor(callback:()=>void) {
    this.callback=callback
  }

  query(){
    this.callback()
  }
}

export class TestModel{
  isSuccess:boolean=false
  model:Model=new Model(()=>{})

  query(){
    this.model.callback=()=>{
      this.isSuccess =!this.isSuccess
    }

    this.model.query()
  }
}


@Entry
@Component
struct StatePage1 {
  @State message: string = 'Hello World';
  @State payBackValue:PayDetail =new PayDetail()

  @State testModel:TestModel=new TestModel()
  build() {
    Column(){
      Text(`${this.payBackValue.backgroundValue}`).width(100).height(100).backgroundColor(this.payBackValue.backgroundValue)

      Row(){
        Button(`click change value`).onClick((err)=>{
          let self=this.payBackValue
          this.payBackValue.changeBackValue(self)
        })
      }

      Text(this.testModel.isSuccess?`Success`:`Fail`)
      Button(`click to change value`).onClick((err)=>{
        this.testModel.query()
      })
    }.width(`100%`).height(`100%`)

  }
}