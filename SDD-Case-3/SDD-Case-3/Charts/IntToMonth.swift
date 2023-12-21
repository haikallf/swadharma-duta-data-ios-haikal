//
//  IntToMonth.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation
import DGCharts

class IntToMonth: AxisValueFormatter  {
    var weeks = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return weeks[Int(value)]
    }
}
