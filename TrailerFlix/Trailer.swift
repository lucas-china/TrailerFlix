//
//  Trailer.swift
//  TrailerFlix
//
//  Created by Lucas Santana Brito on 02/11/19.
//  Copyright © 2019 lsb.br. All rights reserved.
//

import Foundation

struct Trailer: Codable {
    let title : String
    let url: String
    let rating: Int
    let year: Int
    let poster: String
}
