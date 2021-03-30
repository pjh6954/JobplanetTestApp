//
//  SearchDataModel.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/25.
//

import Foundation
import ObjectMapper
import SwiftyJSON


public struct searchResponseModel : Mappable {
    var minimum_interviews: Int = 0
    var total_page: Int = 0
    var minimum_reviews: Int = 0
    var total_count: Int = 0
    var items: [searchItem] = []
    
    var page: Int = 0
    var page_size: Int = 0
    var minimum_salaries: Int = 0
    
    public init() {
        
    }
    
    public init?(map: Map) {
        self.mapping(map: map)
    }
    
    mutating public func mapping(map: Map) {
        self.minimum_interviews <- map["minimum_interviews"]
        self.total_page         <- map["total_page"]
        self.minimum_reviews    <- map["minimum_reviews"]
        self.total_count        <- map["total_count"]
        self.items              <- map["items"]
        self.page               <- map["page"]
        self.page_size          <- map["page_size"]
        self.minimum_salaries   <- map["minimum_salaries"]
    }
}

public struct searchItem : Mappable {
    //cell_type == CELL_TYPE_COMPANY
    var ranking: Int = -1
    var cell_type: searchResultCellType? = nil
    private var _cell_type: String = "" {
        willSet {
            self.cell_type = searchResultCellType(rawValue: newValue.uppercased())
        }
    }
    //company review data
    var pros: String = "" // 장점
    var cons: String = "" // 단점
    var days_ago : Int = 0 // 작성 날짜로 추정
    var occupation_name: String = ""
    var date : Date? = nil
    private var _date: String = "" {
        willSet {
            guard !newValue.isEmpty else {
                self.date = nil
                return
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // not zulu time : default = locale
            let result = dateFormatter.date(from: newValue)
            NSLog("CHeck respons : \(newValue):: \(result)")
            self.date = result
        }
    }
    //
    var interview_difficulty: Double = 0.0
    var name: String = ""
    var salary_avg: Int = 0
    var web_site: String = ""
    var logo_path: String = ""
    var interview_question: String = ""
    var company_id: Int = 0
    var has_job_posting : Bool = false
    private var _has_job_posting: String = "" {
        willSet {
            self.has_job_posting = (newValue.lowercased() == "true")
        }
    }
    var rate_total_avg: Double = 0.0
    var industry_id: Int = 0
    var review_summary: String = ""
    var type: searchResultType? = nil
    private var _type : String = "" {
        willSet {
            self.type = searchResultType(rawValue: newValue.uppercased())
        }
    }
    var industry_name: String = ""
    var simple_desc: String = ""
    
    //cell_type == CELL_TYPE_HORIZONTAL_THEME
    var count: Int = 0
    var themes: [searchTheme] = []
    var smb: [String] = []
    public init() {
        
    }
    
    public init?(map: Map) {
        self.mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        self.ranking                <- map["ranking"]
        self._cell_type             <- map["cell_type"]
        self.pros                   <- map["pros"]
        self.cons                   <- map["cons"]
        self.days_ago               <- map["days_ago"]
        self.occupation_name        <- map["occupation_name"]
        self._date                  <- map["date"]
        
        self.interview_difficulty   <- map["interview_difficulty"]
        self.name                   <- map["name"]
        self.salary_avg             <- map["salary_avg"]
        self.web_site               <- map["web_site"]
        self.logo_path              <- map["logo_path"]
        self.interview_question     <- map["interview_question"]
        self.company_id             <- map["company_id"]
        self._has_job_posting       <- map["has_job_posting"]
        self.rate_total_avg         <- map["rate_total_avg"]
        self.industry_id            <- map["industry_id"]
        self.review_summary         <- map["review_summary"]
        self._type                  <- map["type"]
        self.industry_name          <- map["industry_name"]
        self.simple_desc            <- map["simple_desc"]
        self.count                  <- map["count"]
        self.themes                 <- map["themes"]
        self.smb                    <- map["smb"]
    }
}


public struct searchTheme : Mappable {
    var color: String = ""
    var cover_image: String = ""
    var id: Int = 0
    var title: String = ""
    public init() {
        
    }
    
    public init?(map: Map) {
        self.mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        self.color          <- map["color"]
        self.cover_image    <- map["cover_image"]
        self.id             <- map["id"]
        self.title          <- map["title"]
    }
}
