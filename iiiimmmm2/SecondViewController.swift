//
//  SecondViewController.swift
//  iiiimmmm2
//
//  Created by Alexandr Okhotnikov on 27.10.15.
//

import UIKit
import ActorSDK

class SecondViewController: UIViewController//, ActorSDKDelegate
{
    var fakeWindow: UIWindow!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fakeWindow = FakeWindow(vc:self)
//        ActorSDK.sharedActor().delegate = self
        ActorSDK.sharedActor().presentMessengerInWindow(self.fakeWindow)
    }

//    func actorControllerForAuthStart() -> UIViewController? {
//        return nil
//    }
//    func actorControllerForStart() -> UIViewController? {
//        return nil;
//    }
//    func actorControllerAfterLogIn() -> UIViewController? {
//        return nil
//    }
//    func actorControllerForUser(uid: Int) -> AAViewController? {
//        return nil
//    }
//    func actorControllerForGroup(gid: Int) -> AAViewController? {
//        return nil
//    }
//    func actorControllerForConversation(peer: ACPeer) -> UIViewController? {
//        return nil
//    }
//    func actorConfigureBubbleLayouters(builtIn: [AABubbleLayouter]) -> [AABubbleLayouter] {
//        return builtIn
//    }
//    func actorSettingsHeaderDidCreated(controller: AASettingsViewController, section: AAManagedSection) {
//    }
//    func actorSettingsConfigurationWillCreated(controller: AASettingsViewController, section: AAManagedSection) {
//    }
//    func actorSettingsConfigurationDidCreated(controller: AASettingsViewController, section: AAManagedSection) {
//    }
//    func actorSettingsSupportWillCreated(controller: AASettingsViewController, section: AAManagedSection) {
//    }
//    func actorSettingsSupportDidCreated(controller: AASettingsViewController, section: AAManagedSection) {
//    }
}

