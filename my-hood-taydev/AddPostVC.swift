//
//  AddPostVC.swift
//  my-hood-taydev
//
//  Created by Les Taylor on 12/16/15.
//  Copyright © 2015 Les Taylor. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil )
    }
    
   
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
           
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imagePath, title: title, description: desc)
             DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
      /*      let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)*/
        }
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil )
        postImg.image = image
    }

}
