
import SwiftUI

struct LikeView: View {
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                thisMonthSection
                beforeSection
                suggestedForYouSection
                
            }
            .padding(.horizontal)
        }
        .listRowSeparator(.hidden)
        .navigationBarItems(leading: notificationTitle)
    }
    
    private var thisMonthSection: some View {
        Section(header: sectionHeader(title: Strings.thisMonth)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false)
            }
        }
    }
    
    private var beforeSection: some View {
        Section(header: sectionHeader(title: Strings.before)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false, accentColorForFollows: .gray)
            }
        }
    }
    
    private var suggestedForYouSection: some View {
        Section(header: sectionHeader(title: Strings.suggestedForYou)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: true)
            }
        }
    }
    
    
    
    private func sectionHeader(title: String) -> some View {
        HStack {
            Text(title)
                .stringsModifiers(size: 18,
                                  weight: .heavy,
                                  foregroundColor: .black)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
    
    private var notificationTitle: some View {
        Text(Strings.notification)
            .stringsModifiers(size: 25,
                              weight: .bold,
                              design: .default,
                              paddingEdges: .horizontal,
                              paddingLength: -20)
    }
    
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
