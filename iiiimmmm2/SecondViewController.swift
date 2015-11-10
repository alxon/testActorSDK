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

        ActorSDK.sharedActor().createActor()
        self.fakeWindow = FakeWindow(vc:self)
        ActorSDK.sharedActor().presentMessengerInWindow(self.fakeWindow)
    }
}
