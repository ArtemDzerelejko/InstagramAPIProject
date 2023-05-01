//
//  ModelForJsone.swift
//  projectWithInstagram
//
//  Created by artem on 25.04.2023.
//

import Foundation

struct ModelForJsone: Codable {
    let data: [DataObject]?
    let padding: Paging?
    
}

struct DataObject: Codable {
    let caption: String?
    let id: String?
    let username: String?
    let media_url: String?
}

struct Paging: Codable {
    let cursors: Cursors?
}

struct Cursors: Codable {
    let before: String?
    let after: String?
}
