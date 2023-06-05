
import SwiftUI

struct LikeView: View {
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ThisMonthSectionView()
                BeforeSectionView()
                SuggestedForYouSectionView()
                
            }
            .padding(.horizontal)
        }
        .listRowSeparator(.hidden)
        .navigationBarItems(leading: NotificationTitle())
    }
}

private struct ThisMonthSectionView: View {
    var body: some View {
        Section(header: SectionHeaderView(title: Strings.thisMonthLabel)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false)
            }
        }
    }
}

private struct BeforeSectionView: View {
    var body: some View {
        Section(header: SectionHeaderView(title: Strings.beforeLabel)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false, accentColorForFollows: .gray)
            }
        }
    }
}

private struct SuggestedForYouSectionView: View {
    var body: some View {
        Section(header: SectionHeaderView(title: Strings.suggestedForYouLabel)) {
            ForEach(0..<5) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: true)
            }
        }
    }
}

private struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .stringsModifiers(size: 18,
                                  weight: .heavy,
                                  foregroundColor: .black)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

private struct NotificationTitle: View {
    var body: some View {
        Text(Strings.notificationLabel)
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
