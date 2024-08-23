@Observed
class Person{
  name:string=""
  age:number=0

  constructor(name:string,age:number) {
    this.name = name
    this.age = age
  }

}

@Observed
class Persons{
  person:Person

  constructor(person: Person) {
    this.person = person
  }
}
@Component
struct Child01{
  @ObjectLink @Watch('onChange01') persons:Persons
  build() {
    Column() {
      Text(`childO1 persons person name is ${this.persons.person.name}`).margin(20)
      Child02({person:this.persons.person,selectedItemBlock:()=>{
        console.debug('selectedItemBlock before persons.person.name is '+this.persons.person.name)
        this.persons.person=new Person('3311111111111111111111',10000000000000000000)//这种写法child01 和Child02 组件都会刷新
        //this.persons.person.name ='100000000000000' //这种写法属于两层嵌套，Child01中的组件不会刷新，只会刷Child02中的组件
        console.debug('selectedItemBlock after persons.person.name is '+this.persons.person.name)
      }})
    }
  }

  onChange01(changedPropertyName: string) {
    console.debug(`onChange01 person.name is ${this.persons.person.name}`)

  }
}

@Component
struct Child02{
  @ObjectLink @Watch('onChange02')person:Person
  selectedItemBlock?:()=>void

  build() {
    Column(){
      Button('child02 '+this.person.name).height(40).onClick(()=>{
        this.onClickFType()
      }).margin(20)

    }
  }

  private  onClickFType() {
    if (this.selectedItemBlock) {
      this.selectedItemBlock()
      console.debug('inner --------------此时 child02 中的 this.person.name 中的值依然是'+this.person.name)
    }
    console.debug('此时 child02 中的 this.person.name 中的值依然是'+this.person.name)
  }



  onChange02(changedPropertyName: string) {
    console.debug(`onChange2 person name is ${this.person.name}`)
  }

}








@Entry
@Component
struct ObjectLinkQPage {
  @State persons:Persons = new Persons(new Person('1',1))

  build() {
    Column(){
      Child01({persons:this.persons})
    }
  }
}


