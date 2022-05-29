//
//  FKMediaPicker.swift
//  RMessaging
//
//  Created by rajkumar.sharma on 4/25/18.
//  Copyright © 2018 Raj Sharma. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import MobileCoreServices

class FKMediaPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    static let mediaPicker = FKMediaPicker()
    
    typealias DidFinishPickingMediaBlock = (/*_ info: [Hashable : Any], */_ pickedImage: UIImage?) -> Void
    private var finishedPickingMediaWithInfo: DidFinishPickingMediaBlock?
    
    typealias DidCancelledPickingMediaBlock = () -> Void
    var cancelledPickingMediaBlock: DidCancelledPickingMediaBlock?
    
    func pickImageFromDevice(_ imageBlock: @escaping DidFinishPickingMediaBlock) ->Void {
        
        if let currentController = UIWindow.currentController {
            finishedPickingMediaWithInfo = imageBlock
            
            AlertController.actionSheet(title: "", message: "Please select", sourceView: currentController.view, buttons: ["Take Photo", "Choose from gallery", "Cancel"]) { (action, index) in
                
                if index == 0 {
                    
                    self.pickMediaFromCamera(cameraBlock: { (pickedImage: UIImage?) in
                        imageBlock(pickedImage)
                        currentController.dismiss(animated: true)
                    })
                    
                } else if index == 1 {
                    
                    self.pickMediaFromGallery(galleryBlock: { (pickedImage: UIImage?) in
                        imageBlock(pickedImage)
                        currentController.dismiss(animated: true)
                    })
                }
            }
        }
    }
    
    func pickMediaFromCamera(_ isVideo: Bool = false,cameraBlock: @escaping DidFinishPickingMediaBlock) ->Void {
        
        finishedPickingMediaWithInfo = cameraBlock
        
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            
            let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            if (status == .authorized || status == .notDetermined) {
                if let currentController = UIWindow.currentController {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = true
                    
                    if isVideo {
                        imagePicker.mediaTypes = [kUTTypeMovie as String]
                        imagePicker.videoQuality = .typeLow
                    }
                    
                    currentController.present(imagePicker, animated: true, completion: nil)
                }
            }
        } else {
            pickMediaFromGallery(galleryBlock: { (pickedImage: UIImage?) in
                cameraBlock(pickedImage)
            })
        }
    }
    
    func pickMediaFromGallery(_ isVideo: Bool = false, galleryBlock: @escaping DidFinishPickingMediaBlock) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .authorized || status == .notDetermined) {
            if let currentController = UIWindow.currentController {
                finishedPickingMediaWithInfo = galleryBlock
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .savedPhotosAlbum
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                
                if isVideo {
                    imagePicker.mediaTypes = [kUTTypeMovie as String]
                }
                
                currentController.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // MARK:- - image picker delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        if let finishedPickingMediaWithInfo = finishedPickingMediaWithInfo {
            finishedPickingMediaWithInfo(image)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
        if let cancelledPickingMediaBlock = cancelledPickingMediaBlock {
            cancelledPickingMediaBlock()
        }
    }
    
    func pickVideoFromDevice(_ videoBlock: @escaping DidFinishPickingMediaBlock) ->Void {
        
        if let currentController = UIWindow.currentController {
            finishedPickingMediaWithInfo = videoBlock
            
            AlertController.actionSheet(title: "", message: "Please select", sourceView: currentController.view, buttons: ["Record Video", "Choose from gallery", "Cancel"]) { (action, index) in
                
                if index == 0 {
                    
                    self.pickMediaFromCamera(true, cameraBlock: { (pickedImage: UIImage?) in
                        videoBlock(pickedImage)
                    })
                    
                } else if index == 1 {
                    
                    self.pickMediaFromGallery(true, galleryBlock: { (pickedImage: UIImage?) in
                        videoBlock(pickedImage)
                    })
                }
            }
        }
    }
}

// MARK:- Private Extensions

private extension UIApplication {
    static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
         return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
         } else {
            return UIApplication.shared.delegate?.window ?? nil
         }
    }
}

private extension UIWindow {
    
    static var currentController: UIViewController? {
        return UIApplication.keyWindow?.currentController
    }
    
    var currentController: UIViewController? {
        if let vc = self.rootViewController {
            return topViewController(controller: vc)
        }
        return nil
    }
    
    func topViewController(controller: UIViewController? = UIApplication.keyWindow?.rootViewController) -> UIViewController? {
        if let nc = controller as? UINavigationController {
            if nc.viewControllers.count > 0 {
                return topViewController(controller: nc.viewControllers.last!)
            } else {
                return nc
            }
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
