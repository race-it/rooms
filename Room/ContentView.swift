//
//  ContentView.swift
//  Room
//
//  Created by John Jones on 09/06/2019.
//  Copyright © 2019 John Jones. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = RoomStore()
    //var rooms: [Room] = []
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                }
                }
                .navigationBarTitle(Text("Rooms"))
                .navigationBarItems(trailing: EditButton())
                .listStyle(.grouped)
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    
    
    func delete(at offsets: IndexSet) {
        //store.rooms.remove(atOffsets : offsets)
        offsets.sorted { $0 > $1 }.forEach { store.rooms.remove(at: $0) }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        //stores.room.move(fromOffsets: source, toOffset: destination)
        source.sorted { $0 > $1 }.forEach { store.rooms.insert(store.rooms.remove(at: $0), at: destination) }
    }
    
    //func delete(at offsets: IndexSet) {
    //    store.rooms.remove
    //}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
        }
        
    }
}
#endif

struct RoomCell : View {
    let room: Room
    var body: some View {
        return NavigationButton(destination: RoomDetail(room : room)) {
            Image(room.thumbnailName)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) People")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
