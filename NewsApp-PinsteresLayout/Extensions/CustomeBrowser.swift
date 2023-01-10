//
//  CustomeBrowser.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 11.01.2023.
//

import Foundation
import SafariServices

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

class CustomeBroweser: NSObject, SFSafariViewControllerDelegate {
    var controller: UIViewController?
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    func open(openURL url: URL) {
        let controller = SFSafariViewController(url: url)
        UIWindow.key?.rootViewController?.present(controller, animated: true, completion: nil)
        controller.delegate = self
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.controller?.dismiss(animated: true)
    }
}
