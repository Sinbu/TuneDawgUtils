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
    
    @IBAction func clearButton(sender: NSButton) {
        statusLabel.stringValue = "Ready"
        nameField.stringValue = ""
        imgurLinkField.stringValue = ""
        locationField.stringValue = ""
        ownerField.stringValue = ""
        ownerEmailField.stringValue = ""
        imgurLinkFailField.stringValue = ""
        self.imgurImage.image = nil
    }
    
    
    @IBAction func submitButton(sender: NSButton) {
        // Validation here normally
        let ref = Firebase(url: "https://tunedog.firebaseio.com/Dogs/\(nameField.stringValue)")
        let ref2 = Firebase(url: "https://tunedog.firebaseio.com/Dogs/")
        var highestID = 0
        ref2.queryOrderedByChild("ID").observeSingleEventOfType(.Value, withBlock: { snapshot in
            highestID = (snapshot.children.allObjects.last!.value!["ID"] as! Int) + 1

            let newDawg = ["ImageURL": self.imgurLinkField.stringValue, "IsHere": "nil", "Location": self.locationField.stringValue, "Owner": self.ownerField.stringValue, "OwnerEmail": self.ownerEmailField.stringValue, "ID": highestID]
            
            ref.setValue(newDawg)
            self.statusLabel.stringValue = "Saved!"
        })
        
    }


}

