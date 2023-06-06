
import SwiftUI

struct ActionButton: View {
    
    var reel: Reel
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            LikeButton()
            CommentButton()
            SendMessageButtonView()
            MoreButton()
        }
    }
}

private struct LikeButton: View {
    var body: some View {
        Button {} label: {
            
            VStack(spacing: 10) {
                
                Image.suitHeartSystem
                    .font(.title)
                Text(Strings.numberOfLikes)
                    .font(.caption.bold())
            }
        }
    }
}

private struct CommentButton: View {
    var body: some View {
        Button {} label: {
            
            VStack(spacing: 10) {
                
                Image.bubbleRightSystem
                    .font(.title)
                Text(Strings.numberOfComments)
                    .font(.caption.bold())
            }
        }
    }
}

private struct SendMessageButtonView: View {
    var body: some View {
        Button {} label: {
            
            VStack(spacing: 10) {
                
                Image.paperplaneSystem
                    .font(.title)
            }
        }
    }
}


private struct MoreButton: View {
    var body: some View {
        Button {} label: {
            Image.moreInformation
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
        }
    }
}
