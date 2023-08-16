//
//  PriceCell.swift
//  Agriculturalknowledge
//
//  Created by user on 2020/9/10.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit
import Charts

class PriceCell: UITableViewCell {
    
    @IBOutlet weak var 作物名稱: UILabel!
    @IBOutlet weak var barChartView: BarChartView!
    
    var price1 = [Double]()
    var price2 = [Double]()
    var price3 = [Double]()
    var price = [(Double,Double,Double)]()
    
    //每个分组之间的间隔
    let groupSpace = 0.31
    
    //同一分组内柱子间隔
    let barSpace = 0.03
    
    //柱子宽度（ (0.2 + 0.03) * 3 + 0.31 = 1.00 -> interval per "group"）
    let barWidth = 0.2
    
    //每组数据条数
    let groupCount = 1

    //x轴标签文字
    var dateArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        today()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func today(){
        let date: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.locale = Locale(identifier: "zh_Hant_TW") // 設定地區(台灣)
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei") // 設定時區(台灣)
        let dateFormatString:String = dateFormatter.string(from: date)
        print("dateFormatString: \(dateFormatString)") // 2018/05/0029 14:56:55

        dateArray.append(dateFormatString)
        
    }
    
    
    func setChart(values: Double, values2: Double, values3: Double){
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<groupCount {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "上價")
        
        
        var dataEntries2 = [BarChartDataEntry]()
        for i in 0..<groupCount {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values2)
            dataEntries2.append(dataEntry)
        }
        let chartDataSet2 = BarChartDataSet(entries: dataEntries2, label: "中價")
        chartDataSet2.colors = [.orange]
        
        var dataEntries3 = [BarChartDataEntry]()
        for i in 0..<groupCount {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values3)
            dataEntries3.append(dataEntry)
        }
        let chartDataSet3 = BarChartDataSet(entries: dataEntries3, label: "下價")
        chartDataSet3.colors = [.green]
        
        let chartData = BarChartData(dataSets: [chartDataSet, chartDataSet2, chartDataSet3])
        
        
        chartData.barWidth = barWidth
        chartData.groupBars(fromX: Double(0), groupSpace: groupSpace, barSpace: barSpace)
        //设置X轴范围
        barChartView.xAxis.axisMinimum = Double(0)
        barChartView.xAxis.axisMaximum = Double(0) + chartData
            .groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
        barChartView.xAxis.centerAxisLabelsEnabled = true  //文字标签居中
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dateArray)
        
        //设置y轴范围
        barChartView.leftAxis.axisMinimum = 0
        barChartView.rightAxis.axisMinimum = 0
        
        barChartView.data = chartData
    }
}

