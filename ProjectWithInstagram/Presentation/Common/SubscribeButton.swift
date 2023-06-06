
import SwiftUI

struct SubscribeButton: View {
    
    let actionForMainButton: () -> Void
    let actionForStoriesViewButton: () -> Void
    let actionForFollowsButton: () -> Void
    let actionForHeartButton: () -> Void
    let actionForRemoveAUserFromTheRecommendationList: () -> Void
    
    @State var xmarkVisible: Bool
    
    var accentColorForFollows: Color = .blue
    var nameAcountWithUnderscore = Strings.nameAcountWithUnderscore
    var name = Strings.name
    var withSmallLetterFollows = Strings.withSmallLetterFollows
    var follows = Strings.withBigLetterFollows
    var showFollowsButton = true
    
    
    var body: some View {
        Button(action: actionForMainButton) {
            HStack {
                
                StoriesViewButton(action: actionForStoriesViewButton, strokeColor: .lightGray)
                
                VStack(alignment: .leading, spacing: 1) {
                    
                    Text(nameAcountWithUnderscore)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Text(name)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text(withSmallLetterFollows)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if showFollowsButton {
                    Button(action: actionForFollowsButton) {
                        Text(follows)
                            .font(.system(size: 17, weight: .medium))
                    }
                    .buttonStyle(.borderedProminent)
                    .accentColor(accentColorForFollows)
                } else {
                    Button(action: actionForHeartButton) {
                        Image.heartSystem
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .accentColor(accentColorForFollows)
                }
                
                if xmarkVisible {
                    Button(action: actionForRemoveAUserFromTheRecommendationList) {
                        Image.xmarkSystem
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .medium))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
