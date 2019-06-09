//
//  RoomStore.swift
//  Room
//
//  Created by John Jones on 09/06/2019.
//  Copyright © 2019 John Jones. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore : BindableObject{
    var rooms: [Room] {
        didSet { didChange.send(Void()) }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
