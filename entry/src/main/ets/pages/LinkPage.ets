

@Component
struct ChildLink{

  @State memberMs:string='mem'

  @Link @Watch('onSourceChange1') sourceNumber: number;

  onSourceChange1(){//当@Watch 的变量变化时候，会调到 onWatch()里面的方法
    this.memberMs='i watched sourceNumberchanged'

  }
  build() {
    Column({space:10}){
      Text(`child memberMs is ${this.memberMs}`)
      Text(`child sourceNum is ${this.sourceNumber}`)
      Button(`child change memerMs`).onClick((err)=>{
        this.memberMs=`i am changed` //这个地方的本地变量改变只会在childLink 组件里面，不会传到父组件中
      })
    }


  }
}





@Entry
@Component
struct LinkPage {
  @State sourceNum:number =0




  build() {
    Column({space:10}){
      Text(`parent sourceNum is ${this.sourceNum}`)
      Button(`change parent sourceNum `).onClick((err)=>{
        this.sourceNum=10000000
      })
      ChildLink({sourceNumber:this.sourceNum})
    }

  }
}