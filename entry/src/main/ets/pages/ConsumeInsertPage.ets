

@Component
struct GrandSon{
  @Consume reviewVotes:number

  build() {
    Column({space:10}){
      Text(`grandSon reviewVotes is ${this.reviewVotes}`)
      Button(`click to increase reviewVotes ${this.reviewVotes},+1`).onClick((err)=>{
        this.reviewVotes++
      })
    }
  }
}

@Component
struct ConsumerSon{
  @Provide({allowOverride:"reviewVotes"})reviewVotes:number=10
  build() {
      GrandSon()
  }
}


@Component
struct ConsumerParent{
  @Provide({allowOverride:"reviewVotes"})reviewVotes:number=100
  build() {
    ConsumerSon()
  }
}


@Entry
@Component
struct ConsumeInsertPage {
  @Provide("reviewVotes")reviewVotes:number=1000


  build() {
    Column(){
      Text(`entry component reviewVotes is ${this.reviewVotes}`)//在这个例子里面，上面Text 展示的reviewVotes 的数值是1000，点击按钮，也会再1000基础上面加减
      Button(`click to increase`).onClick((err)=>{
        this.reviewVotes++
      })
      ConsumerParent() //这个组件里面Text 的是10，会寻找离他最近的@Provide
    }

  }
}