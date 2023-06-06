
import Foundation
import SwiftUI

struct PostDescriptionView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(Strings.numberOfLikes)
                .font(.system(size: 15, weight: .medium, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(Strings.nameAcountWithUnderscore + " " + Strings.someInformation)
                .font(.system(size: 15, weight: .medium, design: .default))
            
            NavigationLink(destination: CommentsView()) {
                
                Text(Strings.viewAllCommentsLabel + "( \(Strings.numberOfComments))")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.gray)
            }
            
            Text(Strings.someTimeAgoLabel)
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 5)
    }
}
