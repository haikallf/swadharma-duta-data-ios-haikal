//
//  DonutChartView.swift
//  SDD-Case-3
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import UIKit

class DonutChartView: UIView {
    var data: [ChartDataPoint] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        let centerX = rect.width / 2
        let centerY = rect.height / 2
        let radius = min(centerX, centerY) - 20
        let lineWidth: CGFloat = 30

        var totalValue: CGFloat = 0

        for point in data {
            totalValue += CGFloat(point.nominal)
        }

        var startAngle: CGFloat = -.pi / 2

        for (index, point) in data.enumerated() {
            let endAngle = startAngle + (CGFloat(point.nominal) / totalValue) * (2 * .pi)

            let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)

            path.lineWidth = lineWidth
            UIColor.random.setFill()
            path.fill()

            // Draw legend label
            let midAngle = (startAngle + endAngle) / 2
            let labelX = centerX + cos(midAngle) * (radius + 40)
            let labelY = centerY + sin(midAngle) * (radius + 40)

            drawLegendLabel(text: "\(point.nominal)", at: CGPoint(x: labelX, y: labelY))

            startAngle = endAngle
        }
    }

    private func drawLegendLabel(text: String, at point: CGPoint) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.sizeToFit()
        label.center = point
        addSubview(label)
    }
}

extension UIColor {
    static var random: UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

