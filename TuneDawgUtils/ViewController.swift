//
//  ViewController.swift
//  TuneDawgUtils
//
//  Created by Sina Yeganeh on 02/04/2016.
//  Copyright © 2016 Sina Yeganeh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var nameField: NSTextField!
    @IBOutlet var imgurLinkField: NSTextField!
    @IBOutlet var locationField: NSTextField!
    @IBOutlet var ownerField: NSTextField!
    @IBOutlet var ownerEmailField: NSTextField!
    @IBOutlet var imgurImage: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

