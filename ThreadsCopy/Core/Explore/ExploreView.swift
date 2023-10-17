//
//  ExploreView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0...10, id:\.self) { user in
                            
                            VStack {
                                UserCell()
                                
                                Divider()
                            }
                            
                        }
                        
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
                .navigationTitle("Search")
            }
        }
    }
}

#Preview {
    ExploreView()
}
