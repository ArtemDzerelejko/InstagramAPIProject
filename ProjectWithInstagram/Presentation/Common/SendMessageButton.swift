
import SwiftUI

struct SendMessageButton: View {
    
    let actionForMainButton: () -> Void
    let actionForStoriesViewButton: () -> Void
    let actionForCameraButton: () -> Void
    
    var body: some View {
        
        Button(action: actionForMainButton) {
            
            HStack {
                
                StoriesViewButton(action: actionForStoriesViewButton, strokeColor: .black, backgroundColor: .gray)
                    .padding(.vertical)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 0.5) {
                    
                    Text (Strings.nameAcountWithUnderscore)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.vertical, -25)
                        .foregroundColor(.black)
                        .padding(.horizontal, -10)
                    
                    Text(Strings.wasOnlineSometimeAgo)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.horizontal, -10)
                        .lineLimit(1)
                    
                }
                
                HStack {
                    
                    Spacer()
                    Button(action: actionForCameraButton) {
                        Image(systemName: "camera")
                            .font(.system(size: 20, weight: .heavy, design: .monospaced))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }.buttonStyle(.plain)
                    
                }
                
            }
        }
        .buttonStyle(.plain)
    }
}

