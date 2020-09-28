//
//  TopView.swift
//  todus
//
//  Created by Asiel Cabrera on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct TopView: View {
    @State var search = ""
    @State var timer: Timer?
    
    @State var isShow: Bool = false
    @State var showStory: Bool = false
    private var imags =
       ["image01","image02","image03","image04","image05","image06","image07"]
    
    var body : some View {
        
        VStack(spacing: 17) {
            
            HStack {
                
                Text("Todus")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("secondary").opacity(0.7))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("menu")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("secondary").opacity(0.4))
                }
                
            }.padding(15)
                .onTapGesture {
                    self.endEditing(true)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color("secondary"))
                            .padding(18)
                    }
                    .background(Color("secondary").opacity(0.5))
                    .clipShape(Circle())
                    
                    ForEach(1...7,id: \.self){ i in
                        
                        
                        Button(action: {
                            self.showStory = true
                        }) {
                            
                            Image("p\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                                .overlay(Circle().stroke(Color.secondaryBubbleColor, lineWidth: 1))
                        }
                        .sheet(isPresented: self.$showStory, content: {
                            NewStories()
                        })
                    }
                }
                
            }
                
            }.padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color("primary"))
                
                //            .padding(.bottom, 15)
                .animation(.default)
                .onTapGesture {
                    self.endEditing(true)
            }
            
            
        }
    }
    
    struct TopView_Previews: PreviewProvider {
        static var previews: some View {
            TopView()
        }
}
