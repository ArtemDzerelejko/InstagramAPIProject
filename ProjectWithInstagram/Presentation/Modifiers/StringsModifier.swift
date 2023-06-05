//
//  StringsModifiers.swift
//  ProjectWithInstagram
//
//  Created by artem on 05.06.2023.
//

import Foundation
import SwiftUI

struct StringsModifier: ViewModifier {
    var size: CGFloat?
    var weight: Font.Weight?
    var design: Font.Design?
    var foregroundColor: Color?
    var paddingEdges: Edge.Set?
    var paddingLength: CGFloat?
    var lineLimit: Int?
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
