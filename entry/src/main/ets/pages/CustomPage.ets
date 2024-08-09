@Entry
@Component
struct CustomPage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      MyCustomComponent({mBuilder:ColumnChildren})
    }.backgroundColor(Color.Blue)
  }
}

@Builder
function ColumnChildren() {
  ForEach([1, 2, 3], (index: number) => {
    Text(`Content ${index}`)
      .fontSize(16)
      .width(100)
      .height(100)
      .borderWidth(2)
      //.offset({x:10,y:10})
  })
}

@Component
struct MyCustomComponent {
  @Builder
  doNothingBuilder() {
  };

  @BuilderParam mBuilder: () => void = this.doNothingBuilder
  @State startSize: number = 100
  resultSize: SizeResult = {
    width: 0,
    height: 0
  };

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    let size=100
    children.forEach((child)=>{
      let measureResult=child.measure({minWidth:size,maxWidth:size,minHeight:size,maxHeight:size})
      size +=measureResult.width/2

    })
   /* this.resultSize.width=100;
    this.resultSize.height=400;*/ //这段代码似乎没有用
    return this.resultSize
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    let startPos=300
    children.forEach((child)=>{
        let pos=startPos-child.measureResult.height
        child.layout({x:pos,y:pos})
    })

  }

  build() {
    this.mBuilder()
  }
}