class  ClassA{
    public value:string

  constructor(value:string) {
      this.value=value
    }
}

class Model{
  public value:string;
  public name:ClassA;

  constructor(value:string,name:ClassA) {
        this.value=value
        this.name = name

  }

}

class ItemBean{
  public num:number=0

  constructor(num:number) {
    this.num=num
  }
}







@Entry
@Component
struct StatePage {
  @State message: string = 'Hello World';

  @State title:Model = new Model(`hello`,new ClassA(`world`))

  @State itemArr:ItemBean[]=[new ItemBean(1),new ItemBean(2)]

  @State mapValue:Map<number,string> = new Map([[0,'a'],[1,`b`],[3,`c`]])
  

  build() {
    Column({space:10}){
      Text(`${this.title.value}`)

      Button(`click to change value`).onClick((err)=>{
        this.title.value=`changed value`
      })

      Text(`${this.title.name.value}`)
      Button(`click to change name.value`).onClick((err)=>{
        this.title.name.value=`title.name.value changed`//state 嵌套属性的赋值观察不到
      })

      Text(`arr value is `)
      
      Divider().backgroundColor(Color.Red)
      
      ForEach(Array.from(this.mapValue.entries()),(item:[number,string])=>{
        Text(`${item[0]}`).fontSize(20)
        Text(`${item[1]}`).fontSize(30)
        Divider().backgroundColor(Color.Blue)
      })
      Button(`init Map`).onClick((err)=>{
        this.mapValue=new Map([[0,'a'],[1,`b`],[3,`c`]])
      })

      Button(`add one`).onClick((err)=>{
        this.mapValue.set(2,`b`)
      })
      Button(`change one item`).onClick((err)=>{
        this.mapValue.set(0,'aa')
      })
      Button(`delete one`).onClick((err)=>{
        this.mapValue.delete(1)
      })
      Button(`clear`).onClick((err)=>{
        this.mapValue.clear()
      })

  }


  }
}