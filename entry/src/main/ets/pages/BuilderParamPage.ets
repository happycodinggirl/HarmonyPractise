
@Component
struct ChildItem {
  label: string = `Child`;
  @Builder customBuilder() {};
  @Builder customChangeThisBuilder() {};
  @BuilderParam customBuilderParam: () => void = this.customBuilder;
  @BuilderParam customChangeThisBuilderParam: () => void = this.customChangeThisBuilder;

  build() {
    Column() {
      this.customBuilderParam()
      this.customChangeThisBuilderParam()
    }
  }
}

@Entry
@Component
struct ParentItem {
  label: string = `Parent`;

  @Builder componentBuilder() {
    Text(`${this.label}`)
  }

  build() {
    Column() {
      // 调用this.componentBuilder()时，this指向当前@Entry所装饰的Parent组件，即label变量的值为"Parent"。
      this.componentBuilder()
      ChildItem({
        // 把this.componentBuilder传给子组件Child的@BuilderParam customBuilderParam，this指向的是子组件Child，即label变量的值为"Child"。
        customBuilderParam: this.componentBuilder,//这种写法就是this.componentBuilder 被customBuilderParam接管，所以，调用的内部参数都是child 内部的参数


        // 把():void=>{this.componentBuilder()}传给子组件Child的@BuilderParam customChangeThisBuilderPara，
        // 因为箭头函数的this指向的是宿主对象，所以label变量的值为"Parent"。
        customChangeThisBuilderParam: (): void => { this.componentBuilder() } //这种是自己箭头括号实现，在实现里面调用ParentItem 自身的componentBuilder 方法
      })
    }
  }
}