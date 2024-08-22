

let NextId=0
@Observed
class MClassA{
  id:number
  num:number

  constructor(num: number) {
    this.id = NextId++
    this.num = num
  }

}

@Component
struct MTViewA{

  @ObjectLink classA:MClassA//与用@Prop 不同，使用@ObjectLink 装饰的变量，当变化数组中元素时，后面使用同一个数据的View也会跟着一起变化 ，ObjectLink 是双向变化的，Prop 只是一个副本，单向变化
 // @Prop classA:MClassA

  label:string ='ViewA'


  build() {
    Column({space:5}){
      Text(`viewA id : ${this.classA.id} labelnum : ${this.classA.num}`).margin(20)
      Button(`click to viewA${this.classA.id}  change label`).onClick(()=>{
        this.classA.num +=1
      })

    }
  }
}



@Entry
@Component
struct ObjectLinkAndPropPage {
  @State arrA:MClassA[] =[new MClassA(0),new MClassA(0)]

  build() {
    Column({space:5}){
      ForEach(this.arrA,(item:MClassA)=>{
        MTViewA({label:'View '+item.id,classA:item})
      },(item:MClassA):string=>{ return item.id.toString()})

      Divider().height(10)

      if (this.arrA.length){
        MTViewA({label:'labelFirst',classA:this.arrA[0]})
        MTViewA({label:'labelLast',classA:this.arrA[this.arrA.length-1]})
      }

      Divider().height(10)

      Button(`reset arrA`).onClick(()=>{
        this.arrA = [new MClassA(0),new MClassA(0)]
      })

      Button(`insert class`).onClick(()=>{
        this.arrA.push(new MClassA(10))
      })
      Button(`shift`).onClick(()=>{
        this.arrA.shift()
      })
      Button(`change first item`).onClick(()=>{
        this.arrA[0]=new MClassA(1111)
      })
      Button(`change first item property`).onClick(()=>{
        this.arrA[0].num=10000000
      })


    }



  }
}