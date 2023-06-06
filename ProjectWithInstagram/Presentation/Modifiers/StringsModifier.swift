
import Foundation
import SwiftUI

struct StringsModifier: ViewModifier {
    @State var size: CGFloat?
    @State var weight: Font.Weight?
    @State var design: Font.Design?
    @State var foregroundColor: Color?
    @State var paddingEdges: Edge.Set?
    @State var paddingLength: CGFloat?
    @State var lineLimit: Int?
    func body(content: Content) -> some View {
        content
            .font(.system(size: size ?? 10, weight: weight, design: design))
            .foregroundColor(foregroundColor)
            .padding(paddingEdges ?? .horizontal, paddingLength)
            .lineLimit(lineLimit)
    }
}


extension View {
    func stringsModifiers(size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil, foregroundColor: Color? = nil, paddingEdges: Edge.Set? = nil, paddingLength: CGFloat? = nil, lineLimit: Int? = nil) -> some View {
        modifier(StringsModifier(size: size, weight: weight, design: design, foregroundColor: foregroundColor, paddingEdges: paddingEdges, paddingLength: paddingLength, lineLimit: lineLimit))
    }
}
