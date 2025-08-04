//
//  Category.swift
//  SFSymbolPicker
//
//  Created by Carolane Lefebvre on 04/08/2025.
//

import Foundation

struct Category: Decodable {
    let key: String
    let label: String
    let icon: String
    static var uncategorized: Category {
        return Category(key: "uncategorized", label: "Uncategorized", icon: "questionmark.circle")
    }
}

enum CategoryEnum: String {
    case uncategorized, accessibility, arrows, automotive, cameraandphotos, commerce, communication, connectivity, devices, editing, fitness, gaming, health, home, human, indices, keyboard, maps, math, media, multicolor, nature, objectsandtools, privacyandsecurity, shapes, textformatting, time, transportation, variablecolor, weather, whatsnew
}
