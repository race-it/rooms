//
//  RoomDetail.swift
//  Room
//
//  Created by John Jones on 09/06/2019.
//  Copyright © 2019 John Jones. All rights reserved.
//

import SwiftUI

struct RoomDetail : View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .tapAction {
                    withAnimation(.basic(duration: 2)) {self.zoomed.toggle()}
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill").font(.title).padding(.all).transition(.move(edge: .leading))
            }
        }
        
    
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { RoomDetail(room: testData[0]) }
            NavigationView { RoomDetail(room: testData[1]) }
        }
    }
}
#endif
