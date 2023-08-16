//
//  Vegetable.swift
//  Agriculturalknowledge
//
//  Created by user on 2020/9/9.
//  Copyright © 2020 abc. All rights reserved.
//

import Foundation

struct Vegetable: Codable{
    let 上價 : Double?
    let 下價 : Double?
    let 中價 : Double?
    let 交易日期 : String?
    let 交易量 : Double?
    let 作物代號 : String?
    let 作物名稱 : String?
    let 市場代號 : String?
    let 市場名稱 : String?
    let 平均價 : Double?
    let 種類代碼 : String?
    
    enum CodingKeys: String, CodingKey {
        case 上價 = "上價"
        case 下價 = "下價"
        case 中價 = "中價"
        case 交易日期 = "交易日期"
        case 交易量 = "交易量"
        case 作物代號 = "作物代號"
        case 作物名稱 = "作物名稱"
        case 市場代號 = "市場代號"
        case 市場名稱 = "市場名稱"
        case 平均價 = "平均價"
        case 種類代碼 = "種類代碼"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        上價 = try values.decodeIfPresent(Double.self, forKey: .上價)
        下價 = try values.decodeIfPresent(Double.self, forKey: .下價)
        中價 = try values.decodeIfPresent(Double.self, forKey: .中價)
        交易日期 = try values.decodeIfPresent(String.self, forKey: .交易日期)
        交易量 = try values.decodeIfPresent(Double.self, forKey: .交易量)
        作物代號 = try values.decodeIfPresent(String.self, forKey: .作物代號)
        作物名稱 = try values.decodeIfPresent(String.self, forKey: .作物名稱)
        市場代號 = try values.decodeIfPresent(String.self, forKey: .市場代號)
        市場名稱 = try values.decodeIfPresent(String.self, forKey: .市場名稱)
        平均價 = try values.decodeIfPresent(Double.self, forKey: .平均價)
        種類代碼 = try values.decodeIfPresent(String.self, forKey: .種類代碼)
    }
    
}
