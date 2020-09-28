//
//  CenterView.swift
//  todus
//
//  Created by Asiel Cabrera on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    
    
    var body : some View{
        
        List(DataSource.mockusers){ user in
                CellView(data : user, lastMessage: "ultimo mensaje enviado", lastMDate: "9:51 pm", counterMessages: 3)
        }
        .clipShape(BorderCircleShape())
        
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}

