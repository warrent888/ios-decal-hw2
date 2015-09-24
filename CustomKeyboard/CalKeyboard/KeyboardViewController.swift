//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var ascii: UIButton!
    @IBOutlet var help: UIButton!
    @IBOutlet var newline: UIButton!
    @IBOutlet var delete: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        ascii.addTarget(self, action: "writeText", forControlEvents: .TouchUpInside)
        help.addTarget(self, action: "help", forControlEvents: .TouchUpInside)
        newline.addTarget(self, action: "line", forControlEvents: .TouchUpInside)
        delete.addTarget(self, action: "backspace", forControlEvents: .TouchUpInside)
    }
    
    func writeText() {
        textDocumentProxy.insertText("ascii")
    }
    
    func line() {
        textDocumentProxy.insertText("\n")
    }
    
    func backspace() {
        textDocumentProxy.deleteBackward()
    }


}
