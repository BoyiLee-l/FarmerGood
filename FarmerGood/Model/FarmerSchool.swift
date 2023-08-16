//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct FarmerSchool : Codable {

    let batchId : Int?
    let courseId : Int?
    let 參加對象 : String?
    let 名額 : Int?
    let 報名人數 : Int?
    let 報名時間 : String?
    let 產業別 : String?
    let 聯絡資訊 : String?
    let 訓練別 : String?
    let 課程內容 : String?
    let 課程名稱 : String?
    let 課程地點 : String?
    let 課程型態 : String?
    let 課程日期 : String?
    let 課程費用 : Int?
    let 資格條件 : String?
    let 開課狀態 : String?
    
    enum CodingKeys: String, CodingKey {
        case batchId = "batch_id"
        case courseId = "course_id"
        case 參加對象 = "參加對象"
        case 名額 = "名額"
        case 報名人數 = "報名人數"
        case 報名時間 = "報名時間"
        case 產業別 = "產業別"
        case 聯絡資訊 = "聯絡資訊"
        case 訓練別 = "訓練別"
        case 課程內容 = "課程內容"
        case 課程名稱 = "課程名稱"
        case 課程地點 = "課程地點"
        case 課程型態 = "課程型態"
        case 課程日期 = "課程日期"
        case 課程費用 = "課程費用"
        case 資格條件 = "資格條件"
        case 開課狀態 = "開課狀態"
    }
    
}
