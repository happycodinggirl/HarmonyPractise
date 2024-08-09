
class Tmp{
  param1:string=''
}

@Builder
function overBuilder(tmp:string){
  Row(){
    Text(`UserStateVarByValue:${tmp}`)
  }
}

@Builder
function overBuilderOK(tmp:Tmp){
  Row(){
    Text(`UserStateVarByValue:${tmp.param1}`)
  }
}

@Builder
function overBuilderCustomComp($$:Tmp){
  Column(){
    Text(`i am from customComp`)
    CustomComp({message:$$.param1})
    overBuilderSon({param1:$$.param1})
  }

}

@Builder
function overBuilderSon($$:Tmp){
  Column(){
    Text(`i am from son builder param1 is ${$$.param1}`)
  }
}



@Entry
@Component
struct Parent{
  @State label:string =`hello`
  build() {
    Column({space:10}){
      overBuilder(`${this.label}`)//上述这种传值方式，点击按钮的时候不会引起界面刷新
      Button(){
        Text(`this style cannot change text show content,click here to change lable`).fontSize(20).onClick((err)=>{
          console.info(` to click btn `)
          this.label=" i am changed "
        })
      }

      ParentOk()

      overBuilderCustomComp({param1:this.label})
    }
  }
}
@Component
struct CustomComp{
  @State label:string =`hello`
  @Prop message:string=''
  build() {
    Row(){
      Text(`hello customComp is ${this.message}`)
    }
  }
}






@Component
struct ParentOk{
  @State label:string =`hello`
  build() {
    Column({space:10}){
      overBuilderOK({param1:this.label})//按引用传递参数时候，传递的参数为状态变量，且状态变量的改变会引起@Builder 方法内的ui刷新
      Button(){
        Text(`this style can change text value ,click here to change lable`).fontSize(20).onClick((err)=>{
          console.info(` to click btn `)
          this.label=" i am changed "
        })
      }
    }
  }
}