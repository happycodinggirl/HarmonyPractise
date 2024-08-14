
@Component
struct VChild{

  @Require @State showContent:string="showContent"

  build() {
    Column(){
      Text(this.showContent)
      Button(`change showContent`).onClick((err)=>{
        console.info(`onClick to change showContent`)
        this.showContent = "changed content"
      })
    }
  }
}


@Entry
@Component
struct RequiredPage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      VChild({showContent:"INIT SHOWCONTENT".toLowerCase()})

    }

  }
}