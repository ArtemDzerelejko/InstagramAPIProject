
import SwiftUI

struct LikeView: View {
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                Section(header: HStack {
                    
                    Text(Strings.thisMonth)
                        .stringsModifiers(size: 18,
                                          weight: .heavy,
                                          foregroundColor: .black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }) {
                    ForEach(0..<5) { _ in
                        SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false)
                    }
                }
                
                Section(header: HStack {
                    
                    Text(Strings.before)
                        .stringsModifiers(size: 18,
                                          weight: .heavy,
                                          foregroundColor: .black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                })
                {
                    ForEach(0..<5) { _ in
                        SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false, accentColorForFollows: .gray)
                    }
                }
                
                Section(header: HStack {
                    
                    Text(Strings.suggestedForYou)
                        .stringsModifiers(size: 18,
                                          weight: .heavy,
                                          foregroundColor: .black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                })
                {
                    ForEach(0..<5) { _ in
                        SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: true)
                    }
                }
            }
            .padding(.horizontal)
        }
        .listRowSeparator(.hidden)
        .navigationBarItems(leading: Text(Strings.notification)
            .stringsModifiers(size: 25,
                              weight: .bold,
                              design: .default,
                              paddingEdges: .horizontal,
                              paddingLength: -20)
           
        )
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
