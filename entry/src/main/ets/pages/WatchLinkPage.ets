
class PurchaseItem{
  public price:number
  public id:number
  static  NextId:number =0

  constructor(price: number) {
    this.price=price
    this.id = PurchaseItem.NextId++
  }
}

@Component
struct  BasketView{
  @Link @Watch('onShopBasketUpdate') shopBasket:PurchaseItem[];
  @State totalPurchase:number=0

  getTotal():number{
    let total=this.shopBasket.reduce((sum,i)=>sum+i.price,0)
    if (total > 100) {
     total = total*0.9
    }
    return total
  }

  onShopBasketUpdate(){
    this.totalPurchase = this.getTotal()
  }


  build() {
    Column(){
      Text(`BaseketView total is ${this.totalPurchase}`)
    }
  }
}




@Entry
@Component
struct WatchLinkPage {
  @State basket:PurchaseItem[]=[]

  build() {
    Column(){
      Button(`add to Basket`).onClick((err)=>{
        this.basket.push(new PurchaseItem(Math.round(100*Math.random())))
      }).margin(20)
      BasketView({shopBasket:this.basket})
    }

  }
}