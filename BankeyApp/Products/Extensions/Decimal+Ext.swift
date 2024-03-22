//
//  Decimal+Ext.swift
//  BankeyApp
//
//  Created by Kaan Uzman on 22/3/24.
//

import Foundation
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
