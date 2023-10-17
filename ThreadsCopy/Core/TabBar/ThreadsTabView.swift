//
//  ThreadsTabView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    
    enum TabViewOption {
        case feed, explore, plus, activity, profile
    }
    
    @State private var selectedTab: TabViewOption = .feed
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, selectedTab == .feed ? .fill : .none)
                        
                }
                .tag(TabViewOption.feed)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                       
                }
                .tag(TabViewOption.explore)
            
            CreatThreadView()
                .tabItem {
                    Image(systemName: "plus")
                       
                }
                .tag(TabViewOption.plus)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == .activity ? .fill : .none)
                      
                }
                .tag(TabViewOption.activity)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                      
                }
                .tag(TabViewOption.profile)
        
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
