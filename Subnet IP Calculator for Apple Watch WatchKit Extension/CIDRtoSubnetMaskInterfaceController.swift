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
    let cidrCodes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
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
        convertCIDRToBinary(value: pickerCurrentPos)
        print(quartette_1)
        print(quartette_2)
        print(quartette_3)
        print(quartette_4)
    }
    
    // Converts the CIDR into Binary
    func convertCIDRToBinary(value: Int) {
        let temp: Double = Double(value) / 8
        
        print(temp)
        if temp <= 1 {
            for _ in 0...value{
                quartette_1?.append("1")
            }
            quartette_2 = "00000000"
            quartette_3 = "00000000"
            quartette_4 = "00000000"
        } else if temp <= 2 && temp > 1 {
            for _ in 9...value {
                quartette_2?.append("1")
            }
            quartette_1 = "11111111"
            quartette_3 = "00000000"
            quartette_4 = "00000000"
        } else if temp <= 3 && temp > 2 {
            for _ in 17...value {
                quartette_3?.append("1")
            }
            quartette_1 = "11111111"
            quartette_2 = "11111111"
            quartette_4 = "00000000"
        } else {
            for _ in 25...value {
                quartette_4?.append("1")
            }
            quartette_1 = "11111111"
            quartette_2 = "11111111"
            quartette_3 = "11111111"
        }
    }
    
    func splitBinaryToQuartette(binrary: String) {
        // TODO
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
