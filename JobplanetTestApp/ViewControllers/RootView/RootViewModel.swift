//
//  RootViewModel.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import UIKit
//Button Action, Data Load등을 위한 부분
//Controller에 과도한 Action또는 function이 들어갈 경우 분리.

protocol RootViewModelInput : class {
    func getDatas(str : String?, type: searchResultCellType?)
    func filterContentsForSearchText(_ searchText: String)
}

protocol RootViewModelOutput: class {
    var getDataComplete : (() -> Void)? {get set}
    var getDataError : ((_ error: Error?) -> Void)? {get set}
    
    var filterComplete : (() -> Void)? {get set}
    
    var cellHeight : [CGFloat] {get set}
    
    var defaultDataResponse : searchResponseModel {get set}
    var searchFilterCompany : [searchItem] {get set}// defaultDataResponse의 items중 searchController의 text와 동일한 값들이 필터되어 저장되는 부분.
}

protocol RootViewModelProtocol: class {
    var inputs: RootViewModelInput {get}
    var outputs: RootViewModelOutput {get}
}

class RootViewModel: RootViewModelProtocol, RootViewModelInput, RootViewModelOutput {
    
    init() {
        self.cellHeight = []
        self.defaultDataResponse = .init()
        self.searchFilterCompany = []
    }
    
    //MARK: Inputs
    
    //horizontal, 기본 list들을 모두 갖고와서 보여주기위한 데이터를 load하는 부분.
    //실제로 API와 통신을 하게 되는 경우(Query가 매번 달라지는 경우, 또는 다른 액션이 많이 들어가는 경우) 재활용성을 높이기 위해 ViewModel로 이전하고, Binding하여 사용하게 한다.
    public func getDatas(str: String?, type: searchResultCellType?) {
        APIRequest.shared.requestSearchLists(searchStr: str, type: type) { (result) in
            var returnData : searchResponseModel
            if let _result = result {
                returnData = _result
            }else{
                returnData = .init()
            }
            self.defaultDataResponse = returnData
            self.getDataComplete?()
        } errorHandler: { (error) in
            self.getDataError?(error)
        }

    }
    
    //실질적으로 검색 결과의 filtering을 하는 부분
    public func filterContentsForSearchText(_ searchText: String) {
        self.searchFilterCompany = self.defaultDataResponse.items.filter({ (element) -> Bool in
            element.name.contains(searchText)
        })
        self.filterComplete?()
    }
    //MARK: Private Methods
    
    //MARK: Outputs
    var getDataComplete: (() -> Void)?
    var getDataError: ((Error?) -> Void)?
    var filterComplete: (() -> Void)?
    
    var cellHeight: [CGFloat]
    
    var defaultDataResponse: searchResponseModel
    var searchFilterCompany: [searchItem]
    
    //MARK: Types
    var inputs: RootViewModelInput {return self}
    var outputs: RootViewModelOutput {return self}
}
