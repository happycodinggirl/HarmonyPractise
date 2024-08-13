

@Builder
function myBuilder(content:string,size:number){
  Text(content).fontSize(size).fontColor(Color.Red)
}

@Builder
function myBuilder1(content:string,size:number){
  Text(content).fontSize(size).fontColor(Color.Orange)
}


const  wrapBuilderArr:WrappedBuilder<[string,number]>[]=[wrapBuilder(myBuilder),wrapBuilder(myBuilder1)]



let globaleBuilder: WrappedBuilder<[string,number]> = wrapBuilder(myBuilder)




@Entry
@Component
struct WapBuilderPage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      globaleBuilder.builder(this.message,50)
      Line().height(30)
      ForEach(wrapBuilderArr,(item:WrappedBuilder<[string,number]>)=>{
        item.builder(`item`,50)
      })
      
      
     // myBuilder(this.message,50)
    }
  }
}