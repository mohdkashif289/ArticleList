//
//  NetworkService.swift
//  ArticleList
//
//  Created by Kashif Rizvi on 10/05/22.
//

import Foundation
import UIKit

class NetworkService {
    
    func getArticles(completion: @escaping ([Article]?) -> Void) {
        
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d8d47a81f4f048ecb376439caef1f3d1"
        
        guard let url = URL(string: urlString) else {
            return
        }
            let session = URLSession.shared
            
        session.dataTask(with: url) { data, resposne, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            
            
            let articleList = try? JSONDecoder().decode(ArticleResponse.self, from: data)
            
            DispatchQueue.main.async {
                completion(articleList?.articles)
            }
            
            
        }.resume()
    }
    
    func fetchImage(urlString: String, imageview: UIImageView) {
        
        guard let url = URL(string: urlString) else {
            return
        }
            let session = URLSession.shared
            
        session.dataTask(with: url) { data, resposne, error in
            
            guard let data = data, error == nil else {
                
                return
            }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                imageview.image = image
            }
            
            
        }.resume()
        
        
    }
}
