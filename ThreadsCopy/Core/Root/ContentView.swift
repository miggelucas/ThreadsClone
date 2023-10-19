//
//  ContentView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession != nil {
            ThreadsTabView()
        } else {
            LoginView()
        }
         
       
    }
}

#Preview {
    ContentView()
}
