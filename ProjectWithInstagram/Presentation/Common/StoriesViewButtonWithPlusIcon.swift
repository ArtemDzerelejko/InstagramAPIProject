
import SwiftUI

struct StoriesViewButtonWithPlusIcon: View {
    
    let action: () -> Void
    @State var mainImage = "human"
    @State var textUnderButton = ""
    let widthMainImage: CGFloat
    let heightMainImage: CGFloat
    let widthPlusImage: CGFloat
    let heightPlusImage: CGFloat
    
    init(action: @escaping () -> Void, mainImage: String = "human", textUnderButton: String = "", widthMainImage: CGFloat, heightMainImage: CGFloat, widthPlusImage: CGFloat, heightPlusImage: CGFloat) {
        self.action = action
        self.mainImage = mainImage
        self.textUnderButton = textUnderButton
        self.widthMainImage = widthMainImage
        self.heightMainImage = heightMainImage
        self.widthPlusImage = widthPlusImage
        self.heightPlusImage = heightPlusImage
    }
    
    var body: some View {
        
        Button(action: action) {
            
            VStack {
                
                ZStack(alignment: .bottomTrailing) {
                    
                    Image(mainImage)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: widthMainImage, height: heightMainImage)
                        .clipShape(Circle())
                    
                    Image.plusSystem
                        .resizable()
                        .frame(width: widthPlusImage, height: heightPlusImage)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: 6)
                }
                
                Text(textUnderButton)
                    .foregroundColor(.black)
            }
        }
        .buttonStyle(.plain)
    }
}
