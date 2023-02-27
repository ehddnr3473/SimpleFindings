import UIKit

// 단일 책임 원칙 위배
struct Music {
    let name: String
    let artist: String
    let length: TimeInterval
}

class MusicPlayer {
    var musics: [Music]
    var currentMusicIndex = 0
    
    init(_ musics: [Music]) {
        self.musics = musics
    }
    
    func play() {
        //
    }
    
    func playPreviousMusic() {
        //
    }
    
    func playNextMusic() {
        //
    }
    
    func paues() {
        //
    }
    
    func printCurrentMusic() {
        let currentMusic = musics[currentMusicIndex]
        print("이름: \(currentMusic.name) 아티스트: \(currentMusic.artist) 길이: \(currentMusic.length)")
    }
}

let musics: [Music] = [
    .init(name: "High", artist: "The Chainsmokers", length: 175),
    .init(name: "Bones", artist: "Imagin Dragons", length: 165)
]

let player = MusicPlayer(musics)
player.printCurrentMusic()
