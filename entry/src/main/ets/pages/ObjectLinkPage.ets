
@Observed
class MyDate extends Date{
  constructor(args: number | string) {
    super(args)
  }
}

@Observed
class ClassB{
  public a:MyDate

  constructor(a:MyDate) {
    this.a=a
  }
}

@Component
struct ViewA{
  @ObjectLink linkDate:MyDate //ObjectLink 修饰符和Prop修饰符的区别是 1.@ObjectLink只能接收被@Observed装饰class的实例 2.@ObjectLink装饰的变量不能被赋值，如果要赋值，使用Prop
  //3.Prop 修饰的变量是单向传递的，ObjectLink 修饰的变量是双向传递的，ObjectLink 修饰的变量相当于是指向数据源的指针，一旦重新赋值，同步链将被打断，发生运行时报错。
  build() {
    Column({space:15}){
      Text(`ViewA linkDate is ${this.linkDate}`)
      Button(`increase linkDate by 1`).onClick((err)=>{
        //this.linkDate = new MyDate(`2021-1-1`) 这行代码是错误的，不可以对ObjectLink 装饰符修饰的变量进行赋值，会报错。
        this.linkDate.setDate(this.linkDate.getDate()+1)//这样是可以，这个只是改变变量的值，是允许的
      })
      DatePicker({start:new Date('1970-1-1'),
      end:new Date('2100-1-1'),
      selected:this.linkDate})


    }
  }
}


@Entry
@Component
struct ObjectLinkPage {

  @State myClassB :ClassB = new ClassB(new MyDate('2024-8-16'))


  build() {
    Column({space:15}){
      ViewA({linkDate:this.myClassB.a})
      Button(`update myClassB a `).onClick((err)=>{
        this.myClassB.a=new MyDate('2024-1-1')
      })

      Text(`myClassB.a is ${this.myClassB.a}`)

    }

  }
}