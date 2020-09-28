//
//  CounterNotifications.swift
//  todus
//
//  Created by Wilder Lopez on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//
import SwiftUI

struct CounterNotification : View {
    @State var counter : Int
    var body : some View {
        Text("\(counter <= 999 ? "\(counter)" : "+\(Int((Double(counter) / 1000 ) * 10 / 10))M")")
        .padding(5)
            .foregroundColor(.white)
            .background(
                Rectangle().foregroundColor(Color.primaryBubbleColor)
                    .frame(minWidth: 20, idealHeight: 20, maxHeight: 20, alignment: .center)
                .foregroundColor(.red)
                .cornerRadius(10)
        )
    }
}

struct CounterNotification_Previews: PreviewProvider {
    static var previews: some View {
        
        CounterNotification(counter: 4999)
        
    }
}
