//
//  model.swift
//  TelstraAssignmnet
//
//  Created by Narre Mahesh Kumar on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import Foundation
struct ModelData:Codable {
    var title:String? = nil
    var rows:[ModelRows] = []
    
    enum CodingKeys: String, CodingKey {

        case title = "title"
        case rows = "rows"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        rows = try (values.decodeIfPresent([ModelRows].self, forKey: .rows) ?? [])
       
    }

}


struct ModelRows:Codable{
    var title:String?
    var description:String?
    var imageHref:String?
    
    enum CodingKeys: String, CodingKey {

        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
       
    }
    
}
