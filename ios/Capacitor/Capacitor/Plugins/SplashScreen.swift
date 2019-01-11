import Foundation
import AudioToolbox

@objc(CAPSplashScreenPlugin)
public class CAPSplashScreenPlugin : CAPPlugin {

  // Show the splash screen
  @objc public func show(_ call: CAPPluginCall) {
    let vc = bridge.viewController as! CAPBridgeViewController
    let showDuration = call.get("showDuration", Int.self, vc.defaultShowDuration)!
    let fadeInDuration = call.get("fadeInDuration", Int.self, vc.defaultFadeInDuration)!
    let fadeOutDuration = call.get("fadeOutDuration", Int.self, vc.defaultFadeOutDuration)!
    let autoHide = call.get("autoHide", Bool.self, vc.defaultAutoHide)!
    
    vc.showSplash(showDuration: showDuration, fadeInDuration: fadeInDuration, fadeOutDuration: fadeOutDuration, autoHide: autoHide, completion: {
      call.success()
    }, isLaunchSplash: false)
  }
  
  // Hide the splash screen
  @objc public func hide(_ call: CAPPluginCall) {
    let vc = bridge.viewController as! CAPBridgeViewController
    let fadeDuration = call.get("fadeOutDuration", Int.self, vc.defaultFadeOutDuration)!
    vc.hideSplash(fadeOutDuration: fadeDuration)
    bridge.getWebView()?.alpha = 1;
    call.success()
  }
}

