//
//  prueba.swift
//  todus 2.0
//
//  Created by Asiel Cabrera on 9/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct pruebaData: View {
    @ObservedObject var prueba: DataReload = DataReload()
    
    var body: some View {
        Button(action: {
            self.prueba.prueba = "hola mundo"
        }, label: {
            Text("\(self.prueba.prueba)")
        })
    }
}

struct prueba_Previews: PreviewProvider {
    static var previews: some View {
        pruebaData()
    }
}
