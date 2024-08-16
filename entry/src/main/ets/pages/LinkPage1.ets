
let NextID: number = 1;

@Observed
class Bag{
  public id:number
  public size:number

  constructor(size: number) {
    this.id=NextID++
    this.size=size
  }

}
@Observed
class BookName extends Bag{
  public size:number
  constructor( size: number) {
    super(size)
    this.size=size
  }
}
@Observed
class User{
  public bag:Bag

  constructor(bag:Bag) {
    this.bag=bag
  }
}

@Observed
class Book{
  public bookName:BookName

  constructor(bookName:BookName) {
    this.bookName=bookName
  }
}

@Component
struct MViewA{
  @ObjectLink bag:Bag
  build() {
    Column({space:15}){
      Text(`MVIEWA bag size is ${this.bag.size}`)
      Button(`viewA update size +1`).onClick((err)=>{
        this.bag.size++
      })
    }
  }
}

@Component
struct MViewB{
  @ObjectLink bookName:BookName
  build() {
    Column({space:15}){
      Text(`VIEWB bookname size is ${this.bookName.size}`)
      Button(`update bookName size by increase 1`).onClick((err)=>{
        this.bookName.size++
      })
    }

  }
}



@Entry
@Component
struct LinkPage1 {
  @State user:User = new User(new Bag(10))
  @State book:Book = new Book(new BookName(10))


  build() {
    Column({space:15}){
      MViewA({bag:this.user.bag})
      MViewB({bookName:this.book.bookName})
      Text(`Entry component bookName size is ${this.book.bookName.size}`)
      Text(`Entry component user bag size is ${this.user.bag.size}`)
      Button(`update bookName size add 10`).onClick((err)=>{
        this.book.bookName.size+=10 //这个不会引起 entry组件 Text 里面的数据变化，因为该变化属于第二层的变化，@State 无法观测到第二层的变化，但是MViewB里面的Text
        //可以展示出这个变化，因为 Book 被@Observed 修饰，其属性size 的变化可以被ObjectLink 检测到
      })
      Button(`update user.bag = new Bag(33)`).onClick((err)=>{
        this.user.bag=new Bag(33)//这属于对state变量第一层属性的修改，可以观测到变化
      })

      Button(`update user = new User(new Bag(44))`).onClick((err)=>{
        this.user =  new User(new Bag(44))//对state的修改，可以观测到变化
      })

    }



  }
}