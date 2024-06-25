//
//  API Manager .swift
//  APIandTesting
//
//  Created by Gabriel Eirado on 25/06/24.
//

import Foundation

class APIManager{
    
    
    func fetchWithCompletion(httpLink: String){
        guard let url = URL(string: httpLink) else {return print("Cant find \(httpLink)")}
        
        URLSession.shared.dataTask(with: URLRequest) { <#Data?#>, <#URLResponse?#>, <#(any Error)?#> in
            <#code#>
        }
        
        
        
    }
}
