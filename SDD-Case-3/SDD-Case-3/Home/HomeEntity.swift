//
//  HomeEntity.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

enum ChartType {
    case donut([DonutChartDataDetails])
    case line(LineChartDataDetails)
}

struct ChartData {
    let type: String
    let data: ChartType
}

struct DonutChartDataDetails {
    let label: String?
    let percentage: String?
    let data: [ChartDataPoint]?
    
    init(label: String, percentage: String, data: [ChartDataPoint]) {
        self.label = label
        self.percentage = percentage
        self.data = data
    }
}

struct LineChartDataDetails {
    let month: [Int]
}

struct ChartDataPoint {
    let trx_date: String
    let nominal: Int
}

extension Array where Element == ChartData {
    
    static func dummyData() -> [ChartData] {
        return [
            ChartData(type: "donutChart", data: .donut([
                DonutChartDataDetails(label: "Tarik Tunai", percentage: "55", data: [
                    ChartDataPoint(trx_date: "21/01/2023", nominal: 1000000),
                    ChartDataPoint(trx_date: "20/01/2023", nominal: 500000),
                    ChartDataPoint(trx_date: "19/01/2023", nominal: 1000000)
                ]),
               DonutChartDataDetails(label: "QRIS Payment", percentage: "31", data: [
                    ChartDataPoint(trx_date: "21/01/2023", nominal: 159000),
                    ChartDataPoint(trx_date: "20/01/2023", nominal: 35000),
                    ChartDataPoint(trx_date: "19/01/2023", nominal: 1500)
                ]),
               DonutChartDataDetails(label: "Topup Gopay", percentage: "7.7", data: [
                    ChartDataPoint(trx_date: "21/01/2023", nominal: 200000),
                    ChartDataPoint(trx_date: "20/01/2023", nominal: 195000),
                    ChartDataPoint(trx_date: "19/01/2023", nominal: 5000000)
                ]),
               DonutChartDataDetails(label: "Lainnya", percentage: "6.3", data: [
                    ChartDataPoint(trx_date: "21/01/2023", nominal: 1000000),
                    ChartDataPoint(trx_date: "20/01/2023", nominal: 500000),
                    ChartDataPoint(trx_date: "19/01/2023", nominal: 1000000)
                ])
            ])),
            ChartData(type: "lineChart", data: .line(LineChartDataDetails(month: [3, 7, 8, 10, 5, 10, 1, 3, 5, 10, 7, 7])))
        ]
    }
}
