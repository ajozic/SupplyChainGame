//
//  Chat.swift
//  SupplyChainGame
//
//  Created by Gadzo on 15.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct Chat: View {
    var player: Player
    @ObservedObject var model = ChatModel()

    
    var body: some View {
        VStack {
            Text(player.role).font(.title)
            Divider()
            CustomScrollView(scrollToEnd: true) {
                LazyVStack {
                    ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                        ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?.green : .blue) {
                            Text(model.arrayOfMessages[index])
                        }
                    }
                }
            }.padding(.top)
            HStack {
                ZStack {
                    TextEditor(text: $model.text)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.gray)
                }.frame(height: 50)
                
                Button("send") {
                    if model.text != "" {
                        model.position = model.position
                        model.arrayOfPositions.append(model.position)
                        model.arrayOfMessages.append(model.text)
                        model.text = ""
                        
                    }
                }
            }.padding()
        }
    }
}
