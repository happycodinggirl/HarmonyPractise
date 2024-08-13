
class TempParam{
  param1:string=""
}


@Builder
function overBuilderWithParam(param:TempParam){
  Text(`i am out overBuilderwithParam is ${param.param1}`).fontColor(Color.Blue)
}


@Builder
function overBuilder(){
  Text("i am out overBuilder").fontColor(Color.Blue)
}
@Component
struct Child {
  @Prop childCount:number=0

  decreaseStep:number=1




  @BuilderParam overBuilderWithoutParam:()=>void = overBuilder
  @BuilderParam overBuilderWithParam:($$:TempParam)=>void = overBuilderWithParam



  build() {
    Column({space:20}){
      Text(`child text prop value is ${this.childCount}`)
      Button(){
        Text(`click me to decrease child count`).fontColor(Color.White).onClick((err)=>{
          this.childCount -=this.decreaseStep
          console.info(`childCount is ${this.childCount}`)
        })
      }

      this.overBuilderWithoutParam()
      this.overBuilderWithParam({param1:`i am child param`})
    }

  }
}


@Entry
@Component
struct Parent {

  @State //prop 数据单向传递，负组件 prop 变量的变化会自动同步到子组件，但子组件的变化不会回流到父组件
  parentCount:number = 100



  @Builder
  componentBuilder(){
    Button(){
      Text(`i am Parent Text`)
    }.width(`50%`)
  }

  build() {
      Column({space:20}){
        Text(`parent Text parentCount value is ${this.parentCount}`)
        Button(){
          Text(`parent text click to decrease`).fontColor(Color.Red).onClick((err)=>{
            this.parentCount -=2
            console.info(`parent click to decrease value is ${this.parentCount}`)
          })
        }

        Child({overBuilderWithoutParam: this.componentBuilder,overBuilderWithParam:overBuilderWithParam,childCount:this.parentCount,decreaseStep:5})
      }
  }
}