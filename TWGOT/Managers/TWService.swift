//
//  TWService.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class TWService {
    var url:String!
    var method:String?
    var httpHeaders:[String:String]?
    var body:Data?
   
    func requestForData(onSuccess successHandler: @escaping (_ response:Any) -> Void, onfailure failureHandler: @escaping (_ errorResponse : Any) -> Void){
        let url = URL(string: self.url)!
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else{
                failureHandler(error as Any)
                print(error.debugDescription)
                return
            }
            do{
                let json =  try JSONSerialization.jsonObject(with: data!, options: [])
                successHandler(json)
            }
            catch{
                print("error")
            }
        }
        task.resume()
    }
}
