//
//  NetworkIDManager.swift
//  Subnet IP Calculator for Apple Watch WatchKit Extension
//
//  Created by Apostolos Pezodromou on 1/4/20.
//  Copyright © 2020 Apostolos Pezodromou. All rights reserved.
//

import Foundation


struct NetworkIDManager {
    var subnetMaskBinary: [Int] = []
    var ipAddressBinary: [Int] = []
    var resultIpBinary: [Int] = []
    
    mutating func initializeMask(cidr: Int) {
        var counter = 32
        
        if cidr > 0 {
            for _ in 1...cidr {
                subnetMaskBinary.append(1)
                counter -= 1
            }
        }
        
        if counter > 0 {
            for _ in 1...counter {
                subnetMaskBinary.append(0)
            }
        }
    }
    
    mutating func initializeIpSeagment(ipScetion seagment: Int) {
        var division = seagment
        var tempBits: [Int] = []
        for _ in 1...8 {
            if division > 0 {
                if division % 2 == 0 {
                    tempBits.append(0)
                } else {
                    tempBits.append(1)
                    division -= 1
                }
                division -= division / 2
            } else {
                tempBits.append(0)
            }
        }
        tempBits.reverse()
        ipAddressBinary.append(contentsOf: tempBits)
        print(ipAddressBinary)
    }
}
