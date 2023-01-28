import UIKit

// 단일 책임 원칙 준수
struct Music {
    let name: String
    let artist: String
    let length: TimeInterval
}

class MusicPlayer {
    private var musics: [Music]
    private var currentMusicIndex = 0
    
    // 현재 재생중인 노래를 던져줌.
    var currentMusic: Music {
        musics[currentMusicIndex]
    }
    
    init(_ musics: [Music]) {
        self.musics = musics
    }
    
    func play() { }
    
    func playPreviousMusic() { }
    
    func playNextMusic() { }
    
    func paues() { }
    
//    func fetchCurrentMusic() -> Music {
//        musics[currentMusicIndex]
//    }
}

// 정보를 받아와서 원하는 형식으로 출력
func printMusicInformation(_ player: MusicPlayer) {
    let music = player.currentMusic
    print("이름: \(music.name) 아티스트: \(music.artist) 길이: \(music.length)")
}

let musics: [Music] = [
    .init(name: "High", artist: "The Chainsmokers", length: 175),
    .init(name: "Bones", artist: "Imagin Dragons", length: 165)
]

let player = MusicPlayer(musics)

printMusicInformation(player)
