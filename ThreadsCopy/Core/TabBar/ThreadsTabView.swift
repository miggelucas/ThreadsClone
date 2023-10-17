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
                .toolbarBackground(Color.white, for: .tabBar)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .tag(TabViewOption.feed)
                        .toolbarBackground(Color.white, for: .tabBar)
                       
                }
                .tag(TabViewOption.explore)
            
            CreatThreadView()
                .tabItem {
                    Image(systemName: "plus")
                       
                }
                .tag(TabViewOption.plus)
                .tag(TabViewOption.feed)
                .toolbarBackground(Color.white, for: .tabBar)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == .activity ? .fill : .none)
                      
                }
                .tag(TabViewOption.activity)
                .tag(TabViewOption.feed)
                .toolbarBackground(Color.white, for: .tabBar)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                      
                }
                .tag(TabViewOption.profile)
                .tag(TabViewOption.feed)
                .toolbarBackground(Color.white, for: .tabBar)
            
   
        }
        .tint(.black)
      

    }
}

#Preview {
    ThreadsTabView()
}
