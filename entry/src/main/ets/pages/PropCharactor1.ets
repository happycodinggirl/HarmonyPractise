

@Component
struct PropChild{
  @Prop value:number
  build() {
    Text(`value:${this.value}`).fontSize(30).onClick((err)=>{
      this.value ++
      console.info(`child value is ${this.value}`)
    })
  }


}



@Entry
@Component
struct PropParent {
  @State message: string = 'Hello World';

  @State attr:number[]=[1,2,3]

  build() {
    Column(){
      Text(`item one :${this.attr[0]}`)
      Text(`item two :${this.attr[1]}`)
      Text(`item three:${this.attr[2]}`)

      Divider().height(5)

 /*     ForEach(this.attr, item  =>{
        PropChild({'value':item} as Record<string,number>)

      },item => item.toString())*/
    }


  }
}