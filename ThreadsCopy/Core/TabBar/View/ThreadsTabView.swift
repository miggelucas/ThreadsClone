//
//  ThreadsTabView.swift
//  ThreadsCopy
//
//  Created by Lucas Migge on 17/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    
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
                .toolbarBackground(Color.white, for: .tabBar)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .tag(ThreadTabViewOption.feed)
                        .toolbarBackground(Color.white, for: .tabBar)
                       
                }
                .tag(ThreadTabViewOption.explore)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                       
                }
                .tag(ThreadTabViewOption.plus)
                .toolbarBackground(Color.white, for: .tabBar)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == .activity ? .fill : .none)
                      
                }
                .tag(ThreadTabViewOption.activity)

                .toolbarBackground(Color.white, for: .tabBar)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                      
                }
                .tag(ThreadTabViewOption.profile)
                .toolbarBackground(Color.white, for: .tabBar)
            
   
        }
        .tint(.black)
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
