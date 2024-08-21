

@Component
struct ChildListItem{
  @Link @Watch('onMessageChange') message:number

  index:number =0

  onMessageChange(){
    console.debug(`Child onMessageChange message is ${this.message} index is ${this.index}`)

  }



  build() {
    Text(`index ${this.index} message : ${this.message}`).fontSize(30).margin(20).fontColor(Color.Blue)
  }

}
class BasicDataSource implements  IDataSource{
  changeListener:DataChangeListener[]=[]
  originDataArray:string[]=[]

  totalCount(): number {
    return 0
  }

  getData(index: number): string {
    return this.originDataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.changeListener.indexOf(listener)<0) {
      console.info('add listener')
      this.changeListener.push(listener)
    }
  }

  notifyDataAdd(index:number){
   this.changeListener.forEach(listener=>{
        listener.onDataAdd(index)
   })
  }

  notifyDataReload(index:number){
    this.changeListener.forEach(listener=>{
      listener.onDataReloaded()
    })
  }
  notifyDataChanged(index:number){
    this.changeListener.forEach(listener=>{
      listener.onDataChange(index)
    })
  }
  notifyDataDelete(index:number){
    this.changeListener.forEach(listener=>{
      listener.onDataDelete(index)
    })
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const  pos= this.changeListener.indexOf(listener)
    if (pos>=0) {
      console.info('remove listener')
      this.changeListener.splice(pos,1)
    }
  }

}
class MyDataSource extends  BasicDataSource{
  dataArray:string[]=[]
  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): string {
    return this.dataArray[index]
  }

  public addData(index:number,data:string):void{
    this.dataArray.splice(index,0,data)
    this.notifyDataAdd(index)
  }

  public pushData(data:string){
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length-1)
  }


}



@Entry
@Component
struct FreezeInLazyForEachPage {
  @State message: number =0
  items:number[] =[1,2,3,4,]
  myData:MyDataSource = new MyDataSource()
  aboutToAppear(): void {
    for (let index = 0; index < 20; index++) {
        this.myData.pushData(`hello ${index}`)
    }
  }


  build() {
    Column(){
      Button(`change message `).onClick(()=>{
        this.message+=1
      })
      List({space:3}){
        LazyForEach(this.myData,(item:string)=>{
          ListItem(){
            FreezeListChild({index:item,msgNum:this.message})
          }
        },(item:string)=>item)

      }.cachedCount(5).height(500)
    }
  }
}

@Component({freezeWhenInactive:true})
struct  FreezeListChild{
   @Link @Watch('onMessageChange') msgNum:number
   index:string=''

  aboutToAppear(): void {
    console.info(`childItem about to appear inde is ${this.index}`)
  }

  onMessageChange(){
     console.debug(`freezeListChild item msgNum changed is ${this.msgNum} index is ${this.index}`)
    // 开启freeze后 当 msgNum变化时候，只有cache的5个child 的onMessageChange 会被触发。若不开，则渲染出来的所有child 的回调都会被触发
  }


  build() {
    Text(`message : ${this.msgNum} , index : ${this.index}`).fontSize(30).fontColor(Color.Black).fontWeight(FontWeight.Bold).margin(20)
  }
}