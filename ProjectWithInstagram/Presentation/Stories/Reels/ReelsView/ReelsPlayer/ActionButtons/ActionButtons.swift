
import SwiftUI

struct ActionButton: View {
    
    var reel: Reel
    
    var body: some View {
        
        VStack(spacing: 25) {
            likeButton
            commentButton
            sendMessageButton
            moreButton
        }
    }
    
    private var likeButton: some View {
        Button {} label: {
            VStack(spacing: 10) {
                Image.suitHeartSystem
                    .font(.title)
                Text(Strings.numberOfLikes)
                    .font(.caption.bold())
            }
        }
    }
    
    private var commentButton: some View {
        Button {} label: {
            VStack(spacing: 10) {
                Image.bubbleRightSystem
                    .font(.title)
                Text(Strings.numberOfComments)
                    .font(.caption.bold())
            }
        }
    }
    
    private var sendMessageButton: some View {
        Button {} label: {
            VStack(spacing: 10) {
                Image.paperplaneSystem
                    .font(.title)
            }
        }
    }
    
    private var moreButton: some View {
        Button {} label: {
            Image.moreInformation
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
        }
    }
}
