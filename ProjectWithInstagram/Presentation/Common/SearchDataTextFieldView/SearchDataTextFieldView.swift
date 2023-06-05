
import Foundation
import SwiftUI

struct SearchDataTextFieldView: View {
    let title: String
    let text: Binding<String>
    var body: some View {
        HStack {
            SearchDataTextField(title: title,
                                text: text)
        }
    }
}
