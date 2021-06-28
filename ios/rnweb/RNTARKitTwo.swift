//
//  RNTARKitTwo.swift
//  rnweb
//
//  Created by Rezon Jovian on 6/17/21.
//
// ARKit ARKit integration to React Native using Storyboard with ViewController. It gives us more flexibility in customizing the layout than the ARKitOne.

import Foundation
import UIKit
import SceneKit
import ARKit
import React
 

@objc (RNTARKitTwoView)
class RNTARKitTwoView: UIView, ARSCNViewDelegate {
  
    @objc var title:NSString = "" {
       didSet {
        NSLog("Native Log")
        NSLog(title as String)
       }
    }
  
    @objc var onNativeEvent: RCTBubblingEventBlock?
    weak var ARKitTwoVC: ARKitTwoViewController?
  
    override init(frame: CGRect) {
         super.init(frame: frame)
     }
    required init?(coder aDecoder: NSCoder) { fatalError("nope") }

    override func layoutSubviews() {
        super.layoutSubviews()

        if ARKitTwoVC == nil {
            embed()
        } else {
          ARKitTwoVC?.view.frame = bounds
          
        }
    }
 
    private func embed() {
        guard
            let parentVC = parentViewController  else {
            return
        }
      
        // Init ViewController from Storyboard
        let storyboard = UIStoryboard(name: "ARKitTwo", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ARKitTwoViewController
      
        // Since RN runs on its own VC, we need to attach this VC to parentVC
        parentVC.addChild(vc)
        addSubview(vc.view)
        
        vc.view.frame = bounds
        vc.didMove(toParent: parentVC)
      
        // Register our event callback to the ARKitTwo VC
        vc.setNativeEventCallback(eventCallback: onNativeEvent);
        
        self.ARKitTwoVC = vc;
     }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

@objc (RNTARKitTwoViewManager)
class RNTARKitTwoViewManager: RCTViewManager {
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
   
   override func view() -> UIView! {
     return RNTARKitTwoView()
   }

}
