import SwiftUI

struct ReelsPlayer: View {
    
    @Binding var reel: Reel
    @Binding var currentReel: String
    @State var showMore = false
    @State var isMuted = false
    @State var volumeAnimation = false
    
    var body: some View {
        
        ZStack {
            
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                GeometryReaderView(currentReel: $currentReel, reel: reel)
                VolumeControl(reel: reel, isMuted: $isMuted, volumeAnimation: $volumeAnimation) {}
                
                VStack {
                    
                    Spacer()
                    HStack(alignment: .bottom) {
                        UserInformation(reel: reel)
                        Spacer(minLength: 20)
                        ActionButton(reel: reel)
                    }
                    SoundInformation()
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .bottom)
                VolumeIcon(isMuted: $isMuted, volumeAnimation: $volumeAnimation)
            }
        }
    }
}


private struct GeometryReaderView: View {
    @Binding var currentReel: String
    var reel: Reel
    
    var body: some View {
        GeometryReader { proxy -> Color in
            let minY = proxy.frame(in: .global).minY
            let size = proxy.size
            
            DispatchQueue.main.async {
                if -minY < (size.height / 2) && minY < (size.height / 2) && currentReel == reel.id {
                    reel.player?.play()
                } else {
                    reel.player?.pause()
                }
            }
            
            return Color.clear
        }
    }
}


private struct VolumeControl: View {
    var reel: Reel
    @Binding var isMuted: Bool
    @Binding var volumeAnimation: Bool
    var onTap: () -> Void
    var body: some View {
        Color.black
            .opacity(0.01)
            .frame(width: 150, height: 150)
            .onTapGesture {
                if volumeAnimation {
                    return
                }
                isMuted.toggle()
                
                reel.player?.isMuted = isMuted
                withAnimation {
                    volumeAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation {
                        volumeAnimation.toggle()
                    }
                }
            }
    }
}

private struct UserInformation: View {
    var reel: Reel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(spacing: 15) {
                Image.houseSystem
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(Strings.usernameWhoMadeReel)
                    .font(.callout.bold())
                Button {
                } label: {
                    Text(Strings.withBigLetterFollows)
                        .font(.caption.bold())
                }
                MoreInformation(reel: reel)
            }
        }
    }
}

private struct MoreInformation: View {
    var reel: Reel
    @State var showMore = false
    var body: some View {
        
        ZStack {
            
            if showMore {
                ScrollView(.vertical, showsIndicators: false) {
                    Text(reel.reelsModel.title + sampleText)
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .frame(height: 120)
                .onTapGesture {
                    withAnimation {
                        showMore.toggle()
                    }
                }
            } else {
                Button {
                    withAnimation {
                        showMore.toggle()
                    }
                } label: {
                    
                    HStack {
                        
                        Text(reel.reelsModel.title)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        Text(Strings.moreLabel)
                            .font(.callout.bold())
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

private struct SoundInformation: View {
    var body: some View {
        
        HStack {
            
            Text(Strings.nameOfTheSoundUsedInReel)
                .font(.caption)
                .fontWeight(.semibold)
            Spacer(minLength: 20)
            Image.playSystem
                .font(.system(size: 20))
                .frame(width: 30, height: 30)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.white, lineWidth: 3)
                )
                .offset(x: -5)
        }
        .padding(.top, 10)
    }
}

private struct VolumeIcon: View {
    @Binding var isMuted: Bool
    @Binding var volumeAnimation: Bool
    var body: some View {
        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.secondary)
            .clipShape(Circle())
            .foregroundStyle(.black)
            .opacity(volumeAnimation ? 1 : 0)
    }
}
