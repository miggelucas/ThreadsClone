//
//  SettingsView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 01/11/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: SettingsViewModel())
    }
    
    var body: some View {
        List {
            
            NavigationLink {
                EmptyView()
            } label: {

                Label("About", systemImage: "info.circle")
                    .labelStyle(.titleAndIcon)
            }
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            
            
            Button(role: .destructive) {
                viewModel.singOutPressed()
            } label: {
                Text("Sing out")
            }
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
  
}
