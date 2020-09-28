//
//  ContentView.swift
//  todus 2.0
//
//  Created by Asiel Cabrera on 9/23/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data: DataReload = DataReload()
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
