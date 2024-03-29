//
//  APIManager.swift
//  DemoApp
//
//  Created by Apple on 29/03/24.
//

import Foundation
import Alamofire

class APIManageer{
    
    
    
    static let shared = APIManageer()
    private init(){}
    
    func getApiCall<T:Codable>(url:String,model:T,completion:@escaping(Bool,T?)-> Void){
        
        guard let url = URL(string: url) else{
            return
        }
        
        _ = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            guard let data = data else{
                return
                
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
                completion(true,response)
            }
            catch{
                
                completion(false,nil)
            }
        }.resume()
    
        
    }
}
