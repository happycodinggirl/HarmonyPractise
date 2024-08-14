
@Component
struct ChildDate{
  @Prop childDate:Date = new Date()



  build() {
    Column(){
      Button(`update child date`).margin(10).onClick((err)=>{
        this.childDate=new Date(`2024-8-14`)
      })

      Button(`increase one by year`).margin(10).onClick((err)=>{
        this.childDate.setFullYear(this.childDate.getFullYear()+1)
      })
     DatePicker({
       start:new Date(`1970-1-1`)
       ,end: new Date(`2100-1-1`)
       ,selected:this.childDate

     })



    }


  }
}

//parent 的 parentDate 改变会传导到child 的日期显示，而child 的日期改变不会传导到parent的日期显示
@Entry
@Component
struct PropStatePage {

  @State parentData:Date = new Date()




  build() {
    Column(){
      Button(`update parent date`).margin(10).onClick((err)=>{
        this.parentData=new Date(`2024-1-1`)
      })

      Button(`increase parent date by year`).margin(10).onClick((err)=>{
        this.parentData.setFullYear(this.parentData.getFullYear()+1)
      })


      DatePicker({
        start:new Date(`1970-1-1`),
        end:new Date(`2100-1-1`),
        selected:this.parentData
      })

      ChildDate({childDate:this.parentData})
    }



  }
}