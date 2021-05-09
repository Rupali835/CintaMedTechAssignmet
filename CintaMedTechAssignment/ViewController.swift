//
//  ViewController.swift
//  CintaMedTechAssignment
//
//  Created by Rupali Patil on 09/05/21.
//  Copyright © 2021 63moons. All rights reserved.
//

import UIKit
import ALCameraViewController

class ViewController: UIViewController {

    @IBOutlet weak var m_cPickedImg: UIImageView!
    var minimumSize: CGSize = CGSize(width: 60, height: 60)
    
    var croppingParameters: CroppingParameters {
        return CroppingParameters(isEnabled: true, allowResizing: true, allowMoving: true, minimumSize: minimumSize)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func openCamera()
    {
        let cameraViewController = CameraViewController(croppingParameters: croppingParameters, allowsLibraryAccess: true) { [weak self] image, asset in
            self?.m_cPickedImg.image = image
            self?.dismiss(animated: true, completion: nil)
        }
        
        present(cameraViewController, animated: true, completion: nil)
    }
    
    func openLibrary() {
           let libraryViewController = CameraViewController.imagePickerViewController(croppingParameters: croppingParameters) { [weak self] image, asset in
               self?.m_cPickedImg.image = image
               self?.dismiss(animated: true, completion: nil)
           }
           
           present(libraryViewController, animated: true, completion: nil)
       }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.openCamera()
        }))

        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.openLibrary()
        }))

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

        self.present(actionSheet, animated: true, completion: nil)

    }

    @IBAction func onSourcebtn_Click(_ sender: Any) {
        self.showActionSheet()
    }
    
}

