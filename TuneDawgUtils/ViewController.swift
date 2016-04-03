//
//  ViewController.swift
//  TuneDawgUtils
//
//  Created by Sina Yeganeh on 02/04/2016.
//  Copyright © 2016 Sina Yeganeh. All rights reserved.
//

import Cocoa
import Firebase

class ViewController: NSViewController {
    @IBOutlet var nameField: NSTextField!
    @IBOutlet var imgurLinkField: NSTextField!
    @IBOutlet var locationField: NSTextField!
    @IBOutlet var ownerField: NSTextField!
    @IBOutlet var ownerEmailField: NSTextField!
    @IBOutlet var imgurImage: NSImageView!
    @IBOutlet var statusLabel: NSTextField!
    @IBOutlet var imgurLinkFailField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    @IBAction func imgurLinkField(sender: NSTextField) {
        self.imgurImage.image = nil
        guard let providedURL = NSURL(string: sender.stringValue)
            else {
                print("Image URL fail")
                imgurLinkFailField.stringValue = "Image Failed to load"
                return
        }
        
        guard let data = NSData(contentsOfURL: providedURL)
            else {
                print("Image Data fail")
                imgurLinkFailField.stringValue = "Image Failed to load"
                return
        }
        
        guard let image = NSImage(data: data)
            else {
                print("Image Image fail")
                imgurLinkFailField.stringValue = "Image Failed to load"
                return
        }
        
        imgurLinkFailField.stringValue = ""
        self.imgurImage.image = image
    }
    
    
    @IBAction func submitButton(sender: NSButton) {
        // Validation here normally
        let ref = Firebase(url: "https://tunedog.firebaseio.com/Dogs/\(nameField.stringValue)")
        
        let newDawg = ["ImageURL": imgurLinkField.stringValue, "IsHere": "nil", "Location": locationField.stringValue, "Owner": ownerField.stringValue, "OwnerEmail": ownerEmailField.stringValue]
        
        ref.setValue(newDawg)
        
        
    }


}

