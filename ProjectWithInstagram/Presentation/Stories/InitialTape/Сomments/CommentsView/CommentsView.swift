
import SwiftUI

struct CommentsView: View {
    
    var body: some View {
        
        VStack {
            subscribeButton
        }
        .navigationBarItems(leading: navigationLeadingItems)
        .navigationBarItems(trailing: navigationTrailingItems)
    }
    
    private var subscribeButton: some View {
        ScrollView(showsIndicators: false) {
            ForEach(0..<20) { _ in
                SubscribeButton(actionForMainButton: {}, actionForStoriesViewButton: {}, actionForFollowsButton: {}, actionForHeartButton: {}, actionForRemoveAUserFromTheRecommendationList: {}, xmarkVisible: false, nameAcountWithUnderscore: Strings.nameAcountWithUnderscore, name: Strings.commentsInLowerCase, withSmallLetterFollows: "", follows: "", showFollowsButton: false)
            }
            .padding(.horizontal)
        }.padding(.top)
    }
    
    private var navigationLeadingItems: some View {
        HStack {
            Button(action: {}) {
                Text(Strings.commentsInCapitalLetters)
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .padding(.horizontal, 100)
            }
        }
        .buttonStyle(.plain)
    }
    
    private var navigationTrailingItems: some View {
        HStack {
            NavigationLink(destination: DirectView()) {
                Image.paperplaneSystem
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
            }.buttonStyle(.plain)
                .navigationTitle("")
        }
    }
    
}

struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
