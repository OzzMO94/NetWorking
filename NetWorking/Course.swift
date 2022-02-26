//
//  Course.swift
//  NetWorking
//
//  Created by Максим Хабиров on 22.02.2022.
//

struct Course: Decodable {
        
    let name: String
    let imageUrl: String
    let number_of_lessons: Int
    let number_of_tests: Int
}

struct WebsiteDescription: Decodable {
    let courses: [Course]
    let websiteDescription: String
    let websiteName: String 
}
