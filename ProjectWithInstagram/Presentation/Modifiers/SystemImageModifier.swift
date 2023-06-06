
import Foundation
import SwiftUI

struct SystemImageModifier: ViewModifier {
    @State var size: CGFloat?
    @State var weight: Font.Weight?
    @State var design: Font.Design?
    @State var fontWeight: Font.Weight?
    @State var cornerRadius: CGFloat?
    @State var foregroundColor: Color?
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size ?? 17, weight: weight, design: design))
            .foregroundColor(.black)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .fontWeight(fontWeight)
            .cornerRadius(cornerRadius ?? 0)
            .foregroundColor(foregroundColor)
    }
}


extension View {
    func systemImageModified(size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil, fontWeight: Font.Weight? = nil, cornerRadius: CGFloat? = nil, foregroundColor: Color? = nil) -> some View {
        modifier(SystemImageModifier( size: size, weight: weight, design: design, fontWeight: fontWeight, cornerRadius: cornerRadius, foregroundColor: foregroundColor))
    }
}
