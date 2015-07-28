//
//  ImageViewController.swift
//  paybook
//
//  Created by Kinkoi Lo on 7/26/15.
//  Copyright (c) 2015 Kinkoi Lo. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var captionViewWrapper: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var viewWrapperBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldDidBeginEditing(textField: UITextField) {
        println("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        println("textFieldDidEndEditing")
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("Return pressed")
        self.captionViewWrapper.endEditing(true)
        return true
    }
    

    func keyboardWillShow(notification: NSNotification) {
        if let info = notification.userInfo {
            var keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
            let keyboardHeight = keyboardFrame.height
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.viewWrapperBottomConstraint.constant = keyboardHeight
            })
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let info = notification.userInfo {
            var keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
            let keyboardHeight = keyboardFrame.height
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.viewWrapperBottomConstraint.constant = 0
            })
        }
    }
    
}
