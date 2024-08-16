let NextIDO: number = 1;

@Observed
class BagO {
  public id: number;
  public size: number;

  constructor(size: number) {
    this.id = NextIDO++;
    this.size = size;
  }
}

@Observed
class UserO {
  public bag: BagO;

  constructor(bag: BagO) {
    this.bag = bag;
  }
}

@Observed
class BookO {
  public bookName: BookNameO;

  constructor(bookName: BookNameO) {
    this.bookName = bookName;
  }
}

@Observed
class BookNameO extends BagO {
  public nameSize: number;

  constructor(nameSize: number) {
    // 调用父类方法对nameSize进行处理
    super(nameSize);
    this.nameSize = nameSize;
  }
}

@Component
struct ViewA1 {
  label: string = 'ViewA';
  @ObjectLink bag: BagO;

  build() {
    Column() {
      Text(`ViewA [${this.label}] this.bag.size = ${this.bag.size}`)
        .fontColor('#ffffffff')
        .backgroundColor('#ff3d9dba')
        .width(320)
        .height(50)
        .borderRadius(25)
        .margin(10)
        .textAlign(TextAlign.Center)
      Button(`ViewA: this.bag.size add 1`)
        .width(320)
        .backgroundColor('#ff17a98d')
        .margin(10)
        .onClick(() => {
          this.bag.size += 1;
        })
    }
  }
}

@Component
struct ViewC1 {
  label: string = 'ViewC1';
  @ObjectLink bookName: BookNameO;

  build() {
    Row() {
      Column() {
        Text(`ViewC [${this.label}] this.bookName.size = ${this.bookName.size}`)
          .fontColor('#ffffffff')
          .backgroundColor('#ff3d9dba')
          .width(320)
          .height(50)
          .borderRadius(25)
          .margin(10)
          .textAlign(TextAlign.Center)
        Button(`ViewC: this.bookName.size add 1`)
          .width(320)
          .backgroundColor('#ff17a98d')
          .margin(10)
          .onClick(() => {
            this.bookName.size += 1;
            console.log('this.bookName.size:' + this.bookName.size)
          })
      }
      .width(320)
    }
  }
}

@Entry
@Component
struct ViewB {
  @State user: UserO = new UserO(new BagO(0));
  @State child: BookO = new BookO(new BookNameO(0));

  build() {
    Column() {
      ViewA1({ label: 'ViewA #1', bag: this.user.bag })
        .width(320)
      ViewC1({ label: 'ViewC #3', bookName: this.child.bookName })
        .width(320)
      Text(`entry bag size is ${this.user.bag.size}`).margin(10)
      Text(`entry child bookName size is ${this.child.bookName.size}`).margin(10)
      Button(`ViewB: this.child.bookName.size add 10`)
        .width(320)
        .backgroundColor('#ff17a98d')
        .margin(10)
        .onClick(() => {
          this.child.bookName.size += 10
          console.log('this.child.bookName.size:' + this.child.bookName.size)
        })
      Button(`ViewB: this.user.bag = new Bag(10)`)
        .width(320)
        .backgroundColor('#ff17a98d')
        .margin(10)
        .onClick(() => {
          this.user.bag = new BagO(10);
        })
      Button(`ViewB: this.user = new User(new Bag(20))`)
        .width(320)
        .backgroundColor('#ff17a98d')
        .margin(10)
        .onClick(() => {
          this.user = new UserO(new BagO(20));
        })
    }
  }
}