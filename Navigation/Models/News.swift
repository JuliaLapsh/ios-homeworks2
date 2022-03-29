//
//  Post.swift
//  Navigation
//
//  Created by Юлия on 27.03.2022.
//

import UIKit

struct News: Decodable {
    
    struct Post: Decodable {
        let author, description, image: String
        let likes, views: Int
        
        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }    
    let posts: [Post]
}
