//
//  JokesModel.swift
//  TextAwto
//
//  Created by Kevin Amador Rios on 11/11/22.
//

import Foundation

struct FlagsContents:Decodable {
    let nsfw: Bool
    let religious: Bool
    let political: Bool
    let racist: Bool
    let sexist: Bool
    let explicit: Bool
}

struct JokesModel: Decodable {
    let error: Bool
    let category: String
    let type: String
    let joke: String?
    let setup: String?
    let delivery: String?
    let flags: FlagsContents
    let safe: Bool
    let id: Int
    let lang: String
}
