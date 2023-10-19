//
//  ThreadsTabView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedTab: ThreadTabViewOption = .feed
    @State private var shouldShowCreateThreadView: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, selectedTab == .feed ? .fill : .none)
                    
                }
                .tag(ThreadTabViewOption.feed)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .tag(ThreadTabViewOption.feed)
                    
                }
                .tag(ThreadTabViewOption.explore)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                    
                }
                .tag(ThreadTabViewOption.plus)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == .activity ? .fill : .none)
                    
                }
                .tag(ThreadTabViewOption.activity)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                    
                }
                .tag(ThreadTabViewOption.profile)
            
        }
        .tint(.primary)
        .toolbarBackground(colorScheme == .light ? Color.white : Color.black,
                           for: .tabBar)
        
        .onChange(of: selectedTab, { oldValue, newValue in
            if newValue == .plus {
                shouldShowCreateThreadView = true
                selectedTab = oldValue
            }
        })
        
        .sheet(isPresented: $shouldShowCreateThreadView, content: {
            CreatThreadView()
        })
        
        
        
    }
}

#Preview {
    ThreadsTabView()
}
