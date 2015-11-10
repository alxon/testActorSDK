//
//  FakeWindow.swift
//  iiiimmmm2
//
//  Created by Alexandr Okhotnikov on 05.11.15.
//

import UIKit
import ActorSDK

// UIApplication.sharedApplication().keyWindow?.rootViewController ->  my UITabBarController
//  replaced by ActorSDK.sharedActor().bindedToWindow?.rootViewController
public extension UIViewController {
    public func navigateDetail(controller: UIViewController) {
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad) {
            //let split = UIApplication.sharedApplication().keyWindow?.rootViewController as! UISplitViewController;
            let split = ActorSDK.sharedActor().bindedToWindow?.rootViewController as! UISplitViewController;
            let master = split.viewControllers[0]
            let detail = AANavigationController()
            detail.viewControllers = [controller]
            split.viewControllers = [master, detail]
        } else {
            controller.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(controller, animated: true);
        }
    }
}

public class FakeWindow: UIWindow {

    public var contentVC: UIViewController
    private var _actorVC: UIViewController? = nil

    required public init(vc:UIViewController) {
        self.contentVC = vc
        super.init(frame: CGRectZero)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // !!!!!!!!!!!
    public override var rootViewController: UIViewController? {
        get { return _actorVC }
        set {
            if (self._actorVC != nil) {
                self._actorVC!.view.removeFromSuperview()
                self._actorVC!.removeFromParentViewController()
                self._actorVC = nil;
            }
            
            self._actorVC = newValue;
            
            if (self._actorVC != nil) {
                self.contentVC.addChildViewController(self._actorVC!)
                self.contentVC.view.addSubview(self._actorVC!.view)
                self._actorVC!.view.frame = CGRectMake(0, 0, self.contentVC.view.bounds.size.width, self.contentVC.view.bounds.size.height-48)
                self._actorVC!.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            }
        }
    }
}
