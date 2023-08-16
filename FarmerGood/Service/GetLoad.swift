//
//  getLoad.swift
//  AirQuality
//
//  Created by user on 2020/6/12.
//  Copyright © 2020 abc. All rights reserved.
//

import Foundation
import Alamofire

class GetLoad {
    //MARK:youtube api
    func getVideo(videoUrl:String, completion: @escaping(YoutubeApi) ->Void){
        
        AF.request(videoUrl).responseJSON{response in
            if let data = response.data {
                do{
                    let dataList = try JSONDecoder().decode(YoutubeApi.self, from: data)
                    completion(dataList)
                } catch {
                    print("error:\(error.localizedDescription)")
                }
                
            }
        }
    }
    
    //MARK:留言 api
    func getMes(mesUrl:String, completion: @escaping(Message) ->Void){
        AF.request(mesUrl).responseJSON{response in
            if let data = response.data {
                do{
                    let dataList = try JSONDecoder().decode(Message.self, from: data)
                    completion(dataList)
                } catch {
                    print("error:\(error.localizedDescription)")
                }
                
            }
        }
    }
    
    //MARK:農業課程 api
    func getSchool(classUrl:String, completion: @escaping([FarmerSchool]) ->Void){
        AF.request(classUrl).responseJSON{response in
            if let data = response.data {
                do{
                    let dataList = try JSONDecoder().decode([FarmerSchool].self, from: data)
                    completion(dataList)
                } catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    //MARK:菜價 api
    func getVegetable(vegatableUrl:String, completion: @escaping([Vegetable]) ->Void){
           AF.request(vegatableUrl).response{ response in
               if let data = response.data {
                   do{
                       let dataList = try JSONDecoder().decode([Vegetable].self, from: data)
                       completion(dataList)
                   } catch {
                       print("error:\(error.localizedDescription)")
                   }
               }
           }
       }
    
    func fetchData(url: URL, completion: @escaping(SearchData) ->Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let feedData = try? JSONDecoder().decode(SearchData.self, from: data) {
                completion(feedData)
            }else{
               
            }
        }
        task.resume()
    }
    
}
