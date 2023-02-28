/*
 Monostate(단일 상태)
 - Monostate 패턴은 singularity를 달성하는 또 다른 방법(with singleton).
 - 구조적 제약을 가하는 singleton 패턴과 달리, 행동을 강제하는 메커니즘.
 - 전체 인스턴스가 아닌 static var로 저장됨.
 - 따라서 monostate 클래스는 singleton 클래스와 달리, 메서드 오버라이드, 할당 해제 등에 자유로움.
 - 또한 클래스의 투명성이 보장됨(기존의 클래스와 똑같이 사용).
 - 반면, singleton 클래스는 사용자가 자신이 사용하고 있는 클래스가 singleton 클래스인지 인지하게 됨(불투명).
 - http://staff.cs.utu.fi/~jounsmed/doos_06/material/SingletonAndMonostate.pdf
 */

class Settings {
    enum Theme {
        case `default`
        case old
        case new
    }
    
    private static var theme: Theme?
    
    var currentTheme: Theme {
        get { Settings.theme ?? .default }
        set(newTheme) { Settings.theme = newTheme }
    }
}

import SwiftUI

// When change the theme
let settings = Settings() // Starts using theme .default
settings.currentTheme = .new // Change theme to .new

// On screen 1
let screenColor: Color = Settings().currentTheme == .old ? .gray : .white

// On screen 2
let screenTitle: String = Settings().currentTheme == .old ? "Itunes Connect" : "App Store Connect"
