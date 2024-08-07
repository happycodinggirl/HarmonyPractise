import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default class FuncAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log(` want param bundle name  is ${want.bundleName}`)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

   // if (want["parameters"]!== undefined) {
    if (want.parameters!== undefined) {
      let fromWhere=want.parameters["fromWhere"]
      console.info(`------fromWhere is ${fromWhere}`)
      // receive file descriptor
    //  let fd = want["parameters"]["fromWhere"].value;
      // ...
    }

  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/FuncPage', (err) => {
       let windowClass = windowStage.getMainWindowSync()
       let isLayoutFullWindow =true
      windowClass.setWindowLayoutFullScreen(isLayoutFullWindow).then(()=>{
        console.info("----windowLayoutFullScreen success---")
      }).catch((err:BusinessError)=>{
        console.error(`------error is ${err.message}`)
      })

      let type=window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR
      let avoidArea=windowClass.getWindowAvoidArea(type)
      let navigationHeight=avoidArea.bottomRect.height//获取到导航条区域高度
      console.info(`----navigationHeight is ${navigationHeight}`)

      //隐藏状态栏和导航条
      windowClass.setSpecificSystemBarEnabled(`status`,false).then(()=>{
        console.info(`success in set statusbar invisible`)
      }).catch((err:BusinessError)=>{
        console.error( ` error in set status bar invisible msg is ${err.message}`)
      })

      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
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
