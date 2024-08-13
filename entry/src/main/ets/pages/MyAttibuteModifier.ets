import { ButtonModifier } from '@kit.ArkUI';

export  class MyBottonModifier  extends ButtonModifier {
  isDark:boolean=false

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
    }else{
      instance.backgroundColor(Color.Green)
    }
  }

}