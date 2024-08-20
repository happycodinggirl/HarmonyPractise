

@Component
struct CounterView{
  @Prop @Watch('onIndexChange') index:number=0
  @State total:number =1

  onIndexChange(){
    this.total +=this.index
  }


  build() {
    Column(){
      Text(`CounterView total is ${this.total}`)
    }
  }
}


@Entry
@Component
struct MWatchPage {
  @State index:number= 10

  build() {
    Column(){
      Text(`parent index is ${this.index}`).margin(20)
      Button(`click to change index value `).onClick((err)=>{
        this.index ++
      })

      CounterView({index:this.index})

    }
  }
}