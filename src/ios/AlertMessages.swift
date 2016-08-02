 @objc(ModusEchoSwift) class ModusEchoSwift : CDVPlugin {

    var command : CDVInvokedUrlCommand? = nil

    func pressButton0(alert: UIAlertAction!) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAsString: "OK0"
        )
        self.commandDelegate!.sendPluginResult(
            pluginResult,
            callbackId: command!.callbackId
        )
    }


    func pressButton1(alert: UIAlertAction!) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAsString: "OK1"
        )
        self.commandDelegate!.sendPluginResult(
            pluginResult,
            callbackId: command!.callbackId
        )
    }
   func echo(command: CDVInvokedUrlCommand) {
    self.command = command

     let msg = command.arguments[0] as? String ?? ""

     if msg.characters.count > 0 {
       /* UIAlertController is iOS 8 or newer only. */
       let toastController: UIAlertController =
         UIAlertController(
           title: "",
           message: msg,
           preferredStyle: .Alert
         )
        toastController.addAction(UIAlertAction(title:"Dismiss",style: UIAlertActionStyle.Default,handler: self.pressButton0))
        toastController.addAction(UIAlertAction(title:"Dismiss2",style: UIAlertActionStyle.Default,handler: self.pressButton1))

       self.viewController?.presentViewController(
         toastController,
         animated: true,
         completion: nil
       )
     }
   }
 }