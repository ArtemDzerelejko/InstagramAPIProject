
import SwiftUI

struct SendMessageButton: View {
    
    let actionForMainButton: () -> Void
    let actionForStoriesViewButton: () -> Void
    let actionForCameraButton: () -> Void
    
    var body: some View {
        Button(action: actionForMainButton) {
            
            HStack(spacing: 10) {
                
                StoriesViewButton(action: actionForStoriesViewButton, strokeColor: .black, backgroundColor: .gray)
                    .padding(.vertical)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 0.5) {
                    
                    Text(Strings.nameAcountWithUnderscore)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Text(Strings.wasOnlineSometimeAgo)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Button(action: actionForCameraButton) {
                    Image(systemName: "camera")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
            }
        }
        .buttonStyle(.plain)
    }
}
