
import SwiftUI

struct TabViews: View {
    
    var body: some View {
        
        TabView {
            StartView().tabItem {
                
                Image.houseSystem
                
            }
            SearchView().tabItem {
                
                Image.magnifyingglassSystem
            }
            
            AddContentView().tabItem {
                
                Image.plusAppSystem
            }
            
            ReelsView().tabItem {
                
                Image.playSquareSystem
                
            }
            
            PersonalPageView().tabItem {
                
                Image.personCircleFillSystem
            }
        }
        .onAppear() {
           UITabBar.appearance().unselectedItemTintColor = .black
        }
        .accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
