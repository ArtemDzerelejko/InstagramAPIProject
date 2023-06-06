
import Foundation
import SwiftUI

struct PanelOfReactionsToThePostView: View {
    var body: some View {
        
        HStack(spacing: 5) {
            
            Button(action: {}) {
                Image.heartSystem
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
            }
            .buttonStyle(.plain)
            
            NavigationLink(destination: CommentsView()) {
                
                Image.messageSystem
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
            }
            .buttonStyle(.plain)
            
            NavigationLink(destination: DirectView()) {
                
                Image.paperplaneSystem
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            Button(action: {}) {
                Image.bookmarkSystem
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
            }
            .buttonStyle(.plain)
        }
    }
}
