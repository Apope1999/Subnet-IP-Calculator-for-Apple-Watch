//
//  FindNetworkIDSInterfaceController.swift
//  Subnet IP Calculator for Apple Watch WatchKit Extension
//
//  Created by Apostolos Pezodromou on 7/11/19.
//  Copyright © 2019 Apostolos Pezodromou. All rights reserved.
//

import WatchKit
import Foundation


class FindNetworkIDSInterfaceController: WKInterfaceController {
    
    var pickerItems: [WKPickerItem] = []

    @IBOutlet weak var pickerQuartetteOne: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteTwo: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteThree: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteFour: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // Configure pickers
        let pickerItem = WKPickerItem()
        pickerItem.title = "255"
        pickerItems.append(pickerItem)
        pickerQuartetteOne.setItems(pickerItems)
        pickerQuartetteTwo.setItems(pickerItems)
        pickerQuartetteThree.setItems(pickerItems)
        pickerQuartetteFour.setItems(pickerItems)
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
