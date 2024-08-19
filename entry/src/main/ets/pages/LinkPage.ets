

@Component
struct ChildLink{

  @State memberMs:string='mem'

  @Link @Watch('onSourceChange1') sourceNumber: number; //@Link 修饰的变量可以双向同步变化，子组件的变化也会传递给父组件

  onSourceChange1(){//当@Watch 的变量变化时候，会调到 onWatch()里面的方法
    this.memberMs='i watched sourceNumberchanged'

  }
  build() {
    Column({space:10}){
      Text(`child memberMs is ${this.memberMs}`)
      Text(`child sourceNum is ${this.sourceNumber}`)
      Button(`child change memerMs`).onClick((err)=>{
        this.sourceNumber = 22


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