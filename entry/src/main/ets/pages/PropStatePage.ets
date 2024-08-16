
@Component
struct ChildDate1{
  //@Link childDate:Date 此处如果使用link 则子组件的变动会回传给父组件，若使用Prop装饰器，则不会
  //@Prop childDate:Date = new Date()
  @Consume childDate:Date // @Consume 和@Provide 组合 可实现和@Link 相同的效果，
  // 不同的地方在于，@Consume 和@Provide 可以跨多个层级使用，且子组件@Consume 的变量名字必须和父组件的相同
  //即使名字不同 也要设置别名和其相同



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

  @Provide childDate:Date = new Date()
  //@State parentData:Date = new Date()




  build() {
    Column(){
      Button(`update parent date`).margin(10).onClick((err)=>{
        this.childDate=new Date(`2024-1-1`)
      })

      Button(`increase parent date by year`).margin(10).onClick((err)=>{
        this.childDate.setFullYear(this.childDate.getFullYear()+1)
      })


      DatePicker({
        start:new Date(`1970-1-1`),
        end:new Date(`2100-1-1`),
        selected:this.childDate
      })

      ChildDate1()
    }



  }
}