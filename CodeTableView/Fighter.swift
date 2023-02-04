//
//  Fighter.swift
//  CodeTableView
//
//  Created by Dmitry Polyakov on 05.02.2023.
//

struct Fighter {
    let name: String
    let image: String
}

func getFighters() -> [Fighter]{
    var fighters: [Fighter] = []
    
    let names = DataManager.shared.names
    let images = DataManager.shared.images
    
    for index in 0..<names.count {
        let fighter = Fighter(name: names[index], image: images[index])
        fighters.append(fighter)
    }
    return fighters
}
