//
//  BottomView.swift
//  todus
//
//  Created by Asiel Cabrera on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    @Binding var index : Int
    
    var body : some View{
        
        ExpandableButtomPanel(
            Items: [
                ExpandableButtomItem(label: "message.fill"),
                ExpandableButtomItem(label: "person.3.fill"),
                ExpandableButtomItem(label: "gear")
        ])
            .padding(.vertical)
            .padding(.bottom, ((UIApplication.shared.windows.first?.safeAreaInsets.bottom)!)/2)
            .zIndex(33)
        
    }
}


struct ExpandableButtomItem: Identifiable {
    let id = UUID()
    let label: String
    
    private(set) var action: (() -> Void)? = nil
}

struct ExpandableButtomPanel: View {
    
    
    let Items: [ExpandableButtomItem]
    
    private let noop: () -> Void = {}
    private let size: CGFloat = 60
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    private let shadowColor = Color.black.opacity(0.4)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3
    
    @State private var isExpanded = false
    
    var body: some View {
        HStack{
            ForEach(Items) { item in
                Button(action: {
                    item.action?()
                }, label: {
                    Image(systemName: item.label)
                        .foregroundColor(Color.secondaryBubbleColor)
                    
                })
                    .frame(width: self.size, height: self.size)
                    .padding(.horizontal, 5)
                
                
            }
        }
        .background(Color.primaryBubbleColor)
        .foregroundColor(Color.secondaryBubbleColor)
        .cornerRadius(cornerRadius)
        .font(.title)
        .shadow(color: shadowColor, radius: shadowRadius, x: shadowPosition.x, y: shadowPosition.y)
        .animation(.easeInOut)
    }
}

