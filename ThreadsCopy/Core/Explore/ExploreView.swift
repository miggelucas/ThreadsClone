//
//  ExploreView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.filterdUsers) { user in
                            NavigationLink(value: user) {
                                VStack {
                                    UserCell(user: user)
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .refreshable {
                    viewModel.refreshTriggered()
                }
                .searchable(text: $viewModel.searchText, prompt: "Search")
                .navigationTitle("Search")
            }
        }
    }
}

#Preview {
    ExploreView()
}
