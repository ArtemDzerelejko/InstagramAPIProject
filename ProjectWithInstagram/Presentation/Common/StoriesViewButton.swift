
import SwiftUI

struct StoriesViewButton: View {
    
    let action: () -> Void
    @State var strokeColor: Color = .red
    var widthFrame: CGFloat = 20
    var heightFrame: CGFloat = 20
    @State var backgroundColor: Color = .lightGray
    @State var pictureToDisplayInsideButton = "person.fill"
    @State var foregroundColor: Color = .white
    var strokeLineWidth: CGFloat = 2
    @State var textBelowTheButton = ""
    @State var showSecond = false
    
    var body: some View {
        
        VStack {
            
            Button(action: action) {
                
                Image(systemName: pictureToDisplayInsideButton)
                    .resizable()
                    .frame(width: widthFrame, height: heightFrame)
                    .foregroundColor(foregroundColor)
                    .padding(20)
                    .background(backgroundColor)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(strokeColor, lineWidth: strokeLineWidth))
            }
            
            Text(textBelowTheButton)
                .font(.footnote)
                .fontWeight(.light)
                .padding(.vertical, 1)
        }
        .buttonStyle(.plain)
    }
}
