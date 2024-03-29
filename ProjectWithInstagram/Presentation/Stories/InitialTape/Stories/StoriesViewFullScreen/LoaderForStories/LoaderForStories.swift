
import SwiftUI

struct LoaderForStories: View {
    
    @State var width : CGFloat = 100
    @Binding var show : Bool
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var secs : CGFloat = 0
    
    var body : some View{
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .fill(Color.white.opacity(0.6))
                .frame(height: 3)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: width, height: 3)
        }
        .onReceive(self.time) { (_) in
            
            secs += 0.1
            
            if secs <= 6{
                
                let screenWidth = UIScreen.main.bounds.width
                
                width = screenWidth * (secs / 6)
            }
            else{
                show = false
            }
            
        }
    }
}
