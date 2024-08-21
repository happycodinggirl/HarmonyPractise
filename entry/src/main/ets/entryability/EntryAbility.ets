import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let context=this.context

    let eventHub=this.context.eventHub
    eventHub.on("event1",this.eventFuc)
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    this.context.eventHub.off("event1")
  }

  para:Record<string,number> = {'PropA':43}
  storage:LocalStorage = new LocalStorage(this.para)

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');



    windowStage.loadContent('pages/Index', this.storage,(err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');

      PersistentStorage.persistProp('PropA',43)//PersistentStorage和Ui实例相关联，持久化操作需要再UI实例初始化成功后
    });

    let window = windowStage.getMainWindow()
    window.then(window=>{
      let uiContext = window.getUIContext()//Environment 和UIContext 相关联，需要再UIContext明确的时候才可以调用
      uiContext.runScopedTask(()=>{
       let has= Environment.envProp('languageCode','en')
        console.info(`has is ${has}`)

      })


    })

  }

  eventFuc(arg0:Context,arg1:Context):void{
    console.info("tag",`------eventFuc arg0 is ${arg0},${arg1}` )
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
