

@Component
struct ComponentA{
  @Consume consume1:number

  build() {
    Column(){
      Text(`Consume num is ${this.consume1}`)
      Button(`onClick to increase`).margin(10).onClick((err)=>{
        this.consume1++
      })
    }

  }
}


@Component
struct ComponentB{

  build() {
    ComponentC()
  }
}


@Component
struct ComponentC{
  build() {
    Row({space:10}){
      ComponentA()
      ComponentA()
    }
  }
}





@Entry
@Component
struct ConsumePage {

  @Consume consume1:number

  build() {
    Column(){
      Button(`counsume is ${this.consume1},give +1`).onClick((err)=>{
        this.consume1++
      })

      ComponentB()
    }


  }
}