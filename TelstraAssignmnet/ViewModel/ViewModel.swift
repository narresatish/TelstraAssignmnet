//
//  ViewModel.swift
//  TelstraAssignmnet
//
//  Created by Narre Mahesh Kumar on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import Foundation
import UIKit

class ViewModel {

    // Closure use for notifi
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }

    
   // var modelData:ModelData?
    
    
    ///Array of List Model class
    var modelData:ModelData? {
           ///Reload data when data set
          didSet{
        reloadList()
        }
    }
    
    
     // Get data from API
    func fetchData() {
           let urlString: String = serverURL
        var request = URLRequest(url: URL(string: urlString)!)
           request.httpMethod = "GET"
           //create the session object
           let session = URLSession.shared
           //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               // Error
               if let error = error {
                   print("error:", error)
                   return
               }
               // Response Status with HTTPURLResponse
               do {
                   guard let data = data else {return}
                guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
                guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
                   // Using Decoder
                   let decode = JSONDecoder()
                var responseData = try decode.decode(ModelData.self, from: properData)
               //
                let rows =   responseData.rows.filter({ ($0.title?.isEmpty == false ) })
                
                responseData.rows = rows
                self.modelData = responseData
               
               } catch {
                   print("Error ->\(error.localizedDescription)")
                   self.errorMessage(error.localizedDescription)
               }
           })
           task.resume()
       }
}
