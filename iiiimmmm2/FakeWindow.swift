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
    public var viewVC: UIView?
    
    private var _actorVC: UIViewController? = nil
    public override var rootViewController: UIViewController? {
        get { return _actorVC }
        set { changeVC(newValue)
        }
    }

    required public init(vc:UIViewController) {
        self.contentVC = vc
        super.init(frame: CGRectZero)
    }


    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeVC(vc: UIViewController?)
    {
        if (self._actorVC != nil && vc != nil && vc == self._actorVC) {
            return;
        }
        
        if (viewVC == nil)
        {
            let rect: CGRect = self.contentVC.view.bounds
            viewVC = UIView.init(frame: CGRectMake(0, 0, rect.size.width, rect.size.height-48))
            viewVC?.backgroundColor = UIColor.redColor()
            viewVC!.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            self.contentVC.view.addSubview(viewVC!)
        }
        if (self._actorVC != nil)
        {
            self._actorVC!.view.removeFromSuperview()
            self._actorVC!.removeFromParentViewController()
            self._actorVC = nil;
        }
        self._actorVC = vc;
        
        if (vc != nil)
        {
            self.contentVC.addChildViewController(vc!)
            self.viewVC!.addSubview(vc!.view)
            vc!.view.frame = self.viewVC!.bounds
            vc!.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        }
    }

}
