//
//  CIDRtoSubnetMaskManager.swift
//  Subnet IP Calculator for Apple Watch WatchKit Extension
//
//  Created by Apostolos Pezodromou on 31/3/20.
//  Copyright © 2020 Apostolos Pezodromou. All rights reserved.
//

import Foundation

struct CIDRtoSubnetMaskManager {
    var cidr: Int?
    var binaryArray: [String] = []
    var quartette_1 = ""
    var quartette_2 = ""
    var quartette_3 = ""
    var quartette_4 = ""
    
    // Converts the CIDR into Binary
    mutating func convertCIDRToBinary() {
        if let safeCidr = cidr {
            for _ in 1...safeCidr {
                binaryArray.append("1")
            }
            
            let zeros = 32 - safeCidr
            if (zeros != 0) {
                for _ in 1...zeros {
                    binaryArray.append("0")
                }
            }
        }
    }
    
    mutating func splitBinaryToQuartette() {
        for x in 0...7 {
            quartette_1.append(binaryArray[x])
        }
        
        for x in 8...15 {
            quartette_2.append(binaryArray[x])
        }
        
        for x in 16...23 {
            quartette_3.append(binaryArray[x])
        }
        
        for x in 24...31 {
            quartette_4.append(binaryArray[x])
        }
    }
    
    mutating func calculateSubnetMask(forCIDR cidr: Int) -> String {
        self.cidr = cidr
        convertCIDRToBinary()
        splitBinaryToQuartette()
        let subnetMask: String = String(strtoul(quartette_1, nil, 2)) + "." + String(strtoul(quartette_2, nil, 2)) + "." + String(strtoul(quartette_3, nil, 2)) + "." + String(strtoul(quartette_4, nil, 2))
        reset()
        return subnetMask
    }
    
    
    mutating func reset() {
        quartette_1 = ""
        quartette_2 = ""
        quartette_3 = ""
        quartette_4 = ""
        binaryArray = []
    }
}
