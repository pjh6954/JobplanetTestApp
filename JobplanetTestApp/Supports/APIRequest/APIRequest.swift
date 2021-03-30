//
//  APIRequest.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

public typealias requestCompletion = (searchResponseModel?) -> Void
public typealias requestErrorHandler = (Error?) -> Void

public class APIRequest {
    static let shared = APIRequest()
    
    private init() {
        //singleton
    }
    
    //예제 URL로 자료를 reqeust하고 모두 받아오는 부분
    public func requestSearchLists(searchStr: String? = nil, type: searchResultCellType? = nil, completion: @escaping requestCompletion, errorHandler: @escaping requestErrorHandler) {
        guard let url = URL(string: "https://jpassets.jobplanet.co.kr/mobile-config/test_data.json") else {
            completion(nil)
            return
        }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).validate().responseJSON { (response) in
            //NSLog("REsponse : \(response)")
            switch response.result {
            case .success(let value):
                //NSLog("success value : \(value)")
                if let jsonObj = JSON(value).dictionaryObject {
                    guard var mapdata = Mapper<searchResponseModel>().map(JSON: jsonObj) else {
                        completion(nil)
                        return
                    }
                    if let _type = type {
                        let tempDatas = mapdata.items.compactMap { (element) -> searchItem? in
                            if element.cell_type == _type {
                                return element
                            }else {
                                return nil
                            }
                        }
                        mapdata.items = tempDatas
                    }
                    
                    if let _searchStr = searchStr, !_searchStr.isEmpty {
                        //type이 존재하고, company 또는 review일 때만..?
                        let tempDatas = mapdata.items.compactMap { (element) -> searchItem? in
                            if element.name == _searchStr {
                                return element
                            }else if element.industry_name == _searchStr {
                                return element
                            }else{
                                return nil
                            }
                        }
                        mapdata.items = tempDatas
                    }
                    completion(mapdata)
                }else{
                    completion(nil)
                }
                break
            case .failure(let error):
                errorHandler(error)
                break
            }
        }
    }
}
