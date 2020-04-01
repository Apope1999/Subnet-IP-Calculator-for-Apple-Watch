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
    
    var ipAddressValues: [WKPickerItem] = []
    var cidrValues: [WKPickerItem] = []
    var manager = NetworkIDManager()
    

    @IBOutlet weak var pickerQuartetteOne: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteTwo: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteThree: WKInterfacePicker!
    @IBOutlet weak var pickerQuartetteFour: WKInterfacePicker!
    @IBOutlet weak var pickerCIDR: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        // Configure pickers
        for x in 1...255 {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(x)
            ipAddressValues.append(pickerItem)
        }
        
        for x in 1...32 {
            let item = WKPickerItem()
            item.title = "/" + String(x)
            cidrValues.append(item)
        }
        
        pickerCIDR.setItems(cidrValues)
        pickerQuartetteOne.setItems(ipAddressValues)
        pickerQuartetteTwo.setItems(ipAddressValues)
        pickerQuartetteThree.setItems(ipAddressValues)
        pickerQuartetteFour.setItems(ipAddressValues)
        
        // 128.42.5.4
        manager.initializeIpSeagment(ipScetion: 128)
        manager.initializeIpSeagment(ipScetion: 42)
        manager.initializeIpSeagment(ipScetion: 5)
        manager.initializeIpSeagment(ipScetion: 4)
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
