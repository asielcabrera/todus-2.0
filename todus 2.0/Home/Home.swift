//
//  Home.swift
//  todus 2.0
//
//  Created by Asiel Cabrera on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var index: Int = 0
    @State var showStory: Bool = false
   
    
    var body: some View {
    
        
        NavigationView {
            ZStack {
                Color.primaryBubbleColor
                VStack{
                TopView()
                    ZStack {
                        CenterView()
                        VStack {
                            Spacer()
                            BottomView(index: self.$index)
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
