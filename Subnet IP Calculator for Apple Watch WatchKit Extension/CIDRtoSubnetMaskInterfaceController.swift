//
//  CIDRtoSubnetMaskInterfaceController.swift
//  Subnet IP Calculator for Apple Watch WatchKit Extension
//
//  Created by Apostolos Pezodromou on 3/11/19.
//  Copyright © 2019 Apostolos Pezodromou. All rights reserved.
//

import WatchKit
import Foundation


class CIDRtoSubnetMaskInterfaceController: WKInterfaceController {

    var cidr: Int?
    var quartette_1: String?
    var quartette_2: String?
    var quartette_3: String?
    var quartette_4: String?
    let cidrCodes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
    var pickerItems: [WKPickerItem] = []
    var pickerCurrentPos = 1
    
    @IBOutlet weak var pickerValue: WKInterfacePicker!
    
    @IBAction func pickerChanged(_ value: Int) {
        pickerCurrentPos = value + 1
    }
    @IBOutlet weak var subnetMaskLabel: WKInterfaceLabel!
    
    @IBAction func calculateIsClicked() {
        //TODO
        print(pickerCurrentPos)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // Configure picker
        for cidrCode in cidrCodes {
            let item = WKPickerItem()
            item.title = "/" + String(cidrCode)
            pickerItems.append(item)
        }
        pickerValue.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
