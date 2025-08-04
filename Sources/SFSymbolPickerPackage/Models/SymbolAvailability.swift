//
//  Symbol.swift
//  SFSymbolPicker
//
//  Created by Carolane Lefebvre on 04/08/2025.
//
import Foundation

struct Symbol_Availability: Decodable {
    let symbols: [String: String]
    let year_to_release: [String: [String: String]]
}
