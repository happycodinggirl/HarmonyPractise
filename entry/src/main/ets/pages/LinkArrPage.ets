
@Observed
class MPerson{
  age:number

  constructor(age:number) {
    this.age = age
  }


  setAge(age:number){
    this.age=age
  }
  getAge():number{
    return this.age
  }


}
@Observed
class ObservedArray<T> extends Array<T>{
  constructor(args:T[]) {
    if (args instanceof Array) {
      super(...args)
    }else{
      super(args)
    }
  }

}

@Component
struct LinkArrItem{
  @ObjectLink linkArr:ObservedArray<MPerson>
 // @ObjectLink firstElement :MPerson
  build() {
    Column(){
      Button(`insert one item`).onClick((err)=>{
        this.linkArr.push(new MPerson(this.linkArr.length+1))
      }).margin(20)
      Button(`replace All item`).onClick((err)=>{
        let person1=new MPerson(100)
        let person2=new MPerson(200)
        let person3=new MPerson(300)
        this.linkArr =[person1,person2,person3]//ObjectLink 修饰的变量不能被赋值，link 修饰的变量可以被赋值
      })
      Button(`change first element value`).onClick(()=>{

        this.linkArr[0].age=8888888888//这种写法ui 刷新，属于两层嵌套， 无法进行页面的刷新
       //this.linkArr[0]=new MPerson(999999999) //这种可以进行页面的刷新

      })
    }
  }
}





@Entry
@Component
struct LinkArrPage {


  @State linkArr:ObservedArray<MPerson> = new ObservedArray([new MPerson(1),new MPerson(2),new MPerson(3)])
  //@State firstItem:MPerson =this.linkArr[0]

  build() {
    Column(){
      LinkArrItem({linkArr:this.linkArr}).margin(20)
      Button(`click to change first item`).onClick(()=>{

        this.linkArr[0]=new MPerson(22222233) //这种写法不属于二层嵌套，会引起页面的变化
       // this.linkArr[0].age=22222233//这种组件不会刷新，属于两层嵌套

      })
      ForEach(this.linkArr,(item:MPerson)=>{
        Text(`${item.age}`).margin(10).backgroundColor(Color.Orange).fontColor(Color.White).fontSize(28)
      },(item:MPerson)=>item.age.toString())
    }
  }
}