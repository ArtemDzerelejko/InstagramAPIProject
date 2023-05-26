
import SwiftUI
import AVKit

struct ReelsView: View {
    
    private enum Constans {
        static let fileFormat: String = "mp4"
    }
    
    @State var currentReel = ""
    
    @State var reels = ReelsModelJSON.map { item -> Reel in
        
        let url = Bundle.main.path(forResource: item.url, ofType: Constans.fileFormat) ?? ""
        
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        
        return Reel(player: player, reelsModel: item)
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            
            TabView(selection: $currentReel) {
                ForEach($reels){$reel in
                    ReelsPlayer(reel: $reel, currentReel: $currentReel)
                        .frame(width: size.width)
                    
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        .tag(reel.id)
                    
                    
                }
            }
            
            
            .rotationEffect(.init(degrees: 90))
            
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .frame(width: size.width)
            
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
        
        .onAppear{
            currentReel = reels.first?.id ?? ""
        }
        
        .onDisappear{
            guard let reel = reels.first(where: { $0.id == currentReel }) else {
                return
            }
            reel.player?.pause()
        }
        
    }
}

struct ReelsVideoView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}

let sampleText = Strings.descriptionReel
