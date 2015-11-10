# test ActorSDK

Попытка испольовать ActorSDK-iOS не как отдельное приложение для сообщений,
а внедрить в состав существующего как часть приложения (в виде отдельного окна в *UITabBatController*)

Этот пример основан на template "Tabbed Application"

*Важно - для iPad*

Проблемы:

1 Требование *UIWindow* - *presentMessengerInWindow()* и *presentMessengerInNewWindow()*
   переприсваивают *rootViewController* (наше приложения не видно, но можно общаться - отлично!)
   
2 Следствие п1 - в *navigateDetail* пытается использовать *rootViewController* как *UISplitViewController*
(закономерно падает, т.к. у там *UITabBatController*)
   
   ```Objective-c
   if (AADevice.isiPad) {
            let split = UIApplication.sharedApplication().keyWindow?.rootViewController as! UISplitViewController;
   ```
   

Пришлось сделать класс *FakeWindow* для *псевдо-UIWindow*,
используя getter и setter для rootViewController - корректно добавляет все вьюхи *Actor* в *SecondViewController*


Была мысль напрямую использовать вьюхи, но *AAContactsViewController*, *ConversationViewController* и т.д. не *public*

PS использовать API - либо плохо искал, либо нет (нет документации)
