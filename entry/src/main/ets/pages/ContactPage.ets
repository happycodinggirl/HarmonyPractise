let nextId = 0;
@Observed
export class ObservedAArray<T> extends Array<T>{

  constructor(args:T[]) {
    if (args instanceof Array) {
      super(...args)
    }else{
      super(args)
    }
  }

}


@Observed
export class Address{
  stress:string
  zip:number
  city:string

  constructor(stress: string, zip: number, city: string) {
    this.stress = stress
    this.zip = zip
    this.city = city
  }

}
@Observed
export class Person {
  id_: string;
  name: string;
  address: Address;
  phones: ObservedAArray<string>;

  constructor(name: string,
    street: string,
    zip: number,
    city: string,
    phones: string[]) {
    this.id_ = `${nextId}`;
    nextId++;
    this.name = name;
    this.address = new Address(street, zip, city);
    this.phones = new ObservedAArray<string>(phones);//因为phones是嵌套属性，如果要观察到phones的变化，需要extends array ，并用@Observed 观察他
  }
}


export  class AddressBook{
  me:Person
  contacts:ObservedAArray<Person>

  constructor(me: Person, contacts: ObservedAArray<Person>) {
    this.me = me
    this.contacts = contacts
  }

}

@Component
struct PersonView{
  @ObjectLink person:Person
  @ObjectLink phone:ObservedAArray<string>
  @Link selectedPerson:Person

  build() {
    Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
      Text(this.person.name)
      if (this.phone.length){
        Text(this.phone[0])
      }
    }.height(55).backgroundColor(this.selectedPerson.name===this.person.name?"#ffa0a0":"#ffffff").onClick(()=>{
      this.selectedPerson = this.person
    })
  }
}

@Component
struct phonesNum{
  @ObjectLink phones:ObservedAArray<string>

  build() {
    Column(){
      ForEach(this.phones,(phone:ResourceStr,index:number)=>{
        TextInput({text:phone}).width(150).onChange((value)=>{
          this.phones[index!]=value
        })
      },(phone:ResourceStr,index:number)=>`${index}`)
    }
  }
}

@Component
struct PersonEditView{
  @Consume addressBook:AddressBook
  @Link selectedPerson:Person

  @Prop name:string=''
  @Prop phones:ObservedAArray<string> = []
  @Prop address:Address = new Address("",0,"")

  isSelectedPerson(){
    return this.addressBook.contacts.findIndex((person:Person)=>person.id_===this.selectedPerson.id_)
  }

  build() {
    Column(){
      TextInput({text:this.name}).onChange((value)=>{
        this.name = value
      })

      TextInput({text:this.address.stress}).onChange((value)=>{
        this.address.stress=value
      })
      TextInput({text:this.address.city}).onChange((value)=>{
        this.address.city = value
      })
      TextInput({text : this.address.zip.toString()}).onChange((value)=>{
        let result = Number.parseInt(value)
        this.address.zip =Number.isNaN( result)?0:result
      })
      
      if (this.phones.length>0){
        phonesNum({phones:this.phones})
      }

      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
        Text('save contacts').onClick(()=>{
          this.selectedPerson.name = this.name
          this.selectedPerson.address = new Address(this.address.stress,this.address.zip,this.address.city)
          this.phones.forEach((phone:string,index:number)=>{
            this.selectedPerson.phones[index]=phone
          })

        })
        
        if (this.isSelectedPerson()!=-1){
          Text(`Deleted Contact`).onClick(()=>{
            let selectedIndex =this.isSelectedPerson()
            this.addressBook.contacts.splice(selectedIndex,1)
            selectedIndex =(selectedIndex<this.addressBook.contacts.length)?selectedIndex:selectedIndex-1

            this.selectedPerson = (selectedIndex>=0)?this.addressBook.contacts[selectedIndex]:this.addressBook.me

          })
        }
      }
    }


  }
}

@Component
struct AddressBookView {
  @ObjectLink me:Person
  @ObjectLink contacts:ObservedAArray<Person> //
  @State selectedPerson: Person = new Person("", "", 0, "", []);
  aboutToAppear(): void {
    this.selectedPerson = this.me
  }

  build() {
    Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Start}){
      Text('me').margin(20)
      PersonView({person:this.me,phone:this.me.phones,selectedPerson:this.selectedPerson})
      Divider().height(8)
      ForEach(this.contacts,(contact:Person)=>{

        PersonView({person:contact,phone:contact.phones,selectedPerson:this.selectedPerson})

      },(contact:Person)
      :string=> {return contact.id_})

      Divider().height(8)
      Text('Edit').margin(20)
      PersonEditView({
        selectedPerson:this.selectedPerson
        ,name:this.selectedPerson.name,
        address:this.selectedPerson.address,
        phones:this.selectedPerson.phones
      }).borderStyle(BorderStyle.Solid).borderWidth(5).borderColor(Color.Blue).borderRadius(5)
    }

  }

}







@Entry
@Component
struct ContactPage {
  @Provide addressBook:AddressBook = new AddressBook(new Person('me','guangminglu',10,'cq',["12345678912","12345678911"]),
    [new Person("Oly", "Itamerenkatu 9", 180, "Helsinki", ["11*********", "12*********"]),
    new Person("Sam", "Itamerenkatu 9", 180, "Helsinki", ["13*********", "14*********"]),
    new Person("Vivi", "Itamerenkatu 9", 180, "Helsinki", ["15*********", "168*********"]),])

  build() {
    Column(){
      AddressBookView({me:this.addressBook.me,contacts:this.addressBook.contacts,selectedPerson:this.addressBook.me
      })
    }


  }
}