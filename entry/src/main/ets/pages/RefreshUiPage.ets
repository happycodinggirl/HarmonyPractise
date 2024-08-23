@Observed
class RenderClass{
  waitToRender:boolean = false

  constructor() {
  /*  setTimeout(()=>{
      this.waitToRender = true
    },1000)*/
  }
}



@Entry
@Component
struct RefreshUiPage {
  @State @Watch('onRenderChanged') renderClass: RenderClass= new RenderClass();

  @State textColor:Color =Color.Red

  onPageShow(): void {//官方更推荐开发者将在组件中对@Observed装饰的类成员变量进行修改实现刷新。若在RenderClass 里面进行变量修改，不能在1s后实现刷新页面
    setTimeout(()=>{
      this.renderClass.waitToRender=true
    },1000)
  }

  build() {
    Column(){
      Text(`renderClass waitToRender value is ${this.renderClass.waitToRender}`).width('100%').height(100).backgroundColor(this.textColor).margin(20)
      Button('show').onClick(()=>{
        this.textColor=Color.Blue
      })

  }

  }

  onRenderChanged(changedPropertyName: string) {
      console.debug(`onRenderChanged value is ${this.renderClass.waitToRender}`)
  }
}