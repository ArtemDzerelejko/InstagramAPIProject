
import Foundation
import SwiftUI

struct AvatarAndUsernameView: View {
    var body: some View {
        HStack {
            Image.userIcon
                .resizable()
                .imageModified(aspectRatio: .fit, width: 30, height: 30, paddingLength: 5)
                .clipShape(Circle())
            Text(Strings.nameAcountWithUnderscore)
            Spacer()
        }
    }
}
