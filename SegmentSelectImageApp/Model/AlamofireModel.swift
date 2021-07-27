//
//  AlamofireModel.swift
//  SegmentSelectImageApp
//
//  Created by UrataHiroki on 2021/07/27.
//

import Foundation
import Alamofire
import SwiftyJSON


class AlamofireModel{
    
    var jsonResultDatasArray = [JsonDataSets]()
    
}

extension AlamofireModel{
    
    func searchGetImageURL(searchKeyword:String){

            AF.request("https://pixabay.com/api/?key=~~~~~~~~~APIKey~~~~~~~~~&q=\(searchKeyword)", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in

                switch response.result{

                case.success:

                    self.jsonResultDatasArray = [] //以前のデータを削除

                    let jsonResult:JSON = JSON(response.data as Any)

                    for needDataCount in 0...15{

                        if jsonResult["hits"][needDataCount]["webformatURL"].string != nil{

                            let jsonResult = JsonDataSets(imageURLData: jsonResult["hits"][needDataCount]["webformatURL"].string!)

                            self.jsonResultDatasArray.append(jsonResult)

                        }else{

                            break  //取得できる"webformatURL"が無くなった時に処理を終わらせる

                        }
                    }

                case .failure:

                    let error = NSError()
                    print(error.debugDescription)
                    break

                }
            }
        }
    
}
