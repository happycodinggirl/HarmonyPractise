

@Component
struct LittleChild{

  @Prop head:string =  `child`

  @Builder blockPatten(){};//尾随闭包函数

  @BuilderParam close:()=>void = this.blockPatten





  build() {
      Column(){
        Text(`${this.head}`)
        this.close()

      }

  }

}



@Entry
@Component
struct BuilderPage2 {
  @State message: string = 'Hello parent';

  @Builder
  parentAction(){
    Text(`parent action`)

    }

  build() {
    Column(){
      //这种写法要求，LittleChild 必须只有一个无参数的 BuildParam
      LittleChild({head:this.message}){
        Button(){
          Text(`click to make change`)
        }.onClick((err)=>{
          this.message='change,biubiubiu~~~~'
        })
      }

    }

  }
}