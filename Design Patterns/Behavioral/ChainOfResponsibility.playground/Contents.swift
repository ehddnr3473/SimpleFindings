/*
 Chain Of Responsibility
 - 여러 개의 객체가 체인 형태로 연결되어 있고, 체인의 시작부터 끝까지 순서대로 처리하여 요청을 처리하는 패턴
 - 하나의 객체가 모든 요청을 처리하는 것이 아니라, 체인 내의 다른 객체가 요청을 처리할 수 있도록 분산시키는 것을 목적으로 함.
 -> 객체 간의 결합도를 낮추고, 요청 처리 과정을 유연하게 조정.
 */

/*
 구성요소
 1. Handler 인터페이스: 요청을 처리하는 메소드를 정의하는 인터페이스
 2. ConcreteHandler 클래스: 요청을 처리하는 구체적인 객체. 체인의 다음 객체를 가리키는 포인터와 요청 처리 메서드가 구현됨.
 3. Client 클래스: 요청을 초기화하고, 첫 번째 ConcreteHandler 객체에게 전달함.
 
 다음과 같은 상황에서 유용하게 사용될 수 있음.
 1. 요청 처리를 여러 객체에게 분산시켜야 하는 경우
 2. 요청 처리 과정 중에 새로운 요청이 추가되거나, 요청 처리 방법이 변경될 가능성이 있는 경우
 3. 객체 간의 의존성을 줄이고, 유연성을 높일 필요가 있는 경우
 */

// MARK: - 로그 수준을 정의하는 enum
enum LogLevel {
    case debug
    case info
    case warning
    case error
}

// MARK: - Handler 인터페이스
protocol Logger {
    func log(message: String, level: LogLevel)
}

// MARK: - ConcreteHandler 클래스
class DebugLogger: Logger {
    var next: Logger?
    
    init(next: Logger?) {
        self.next = next
    }
    
    func log(message: String, level: LogLevel) {
        if level == .debug {
            print("[DEBUG]: \(message)")
        } else {
            next?.log(message: message, level: level)
        }
    }
}

class InfoLogger: Logger {
    var next: Logger?
    
    init(next: Logger?) {
        self.next = next
    }
    
    func log(message: String, level: LogLevel) {
        if level == .info {
            print("[INFO]: \(message)")
        } else {
            next?.log(message: message, level: level)
        }
    }
}

class WarningLogger: Logger {
    var next: Logger?
    
    init(next: Logger?) {
        self.next = next
    }
    
    func log(message: String, level: LogLevel) {
        if level == .warning {
            print("[WARNING]: \(message)")
        } else {
            next?.log(message: message, level: level)
        }
    }
}

class ErrorLogger: Logger {
    var next: Logger?
    
    init(next: Logger?) {
        self.next = next
    }
    
    func log(message: String, level: LogLevel) {
        if level == .error {
            print("[ERROR]: \(message)")
        } else {
            next?.log(message: message, level: level)
        }
    }
}

// MARK: - Client 클래스
class LogManager: Logger {
    private var debugLogger: Logger
    private var infoLogger: Logger
    private var warningLogger: Logger
    private var errorLogger: Logger
    
    private var startLog: Logger {
        return debugLogger
    }
    
    init(debugLogger: Logger,
         infoLogger: Logger,
         warningLogger: Logger,
         errorLogger: Logger) {
        self.debugLogger = debugLogger
        self.infoLogger = infoLogger
        self.warningLogger = warningLogger
        self.errorLogger = errorLogger
    }
    
    func log(message: String, level: LogLevel) {
        startLog.log(message: message, level: level)
    }
}

let errorLogger = ErrorLogger(next: nil)
let warningLogger = WarningLogger(next: errorLogger)
let infoLogger = InfoLogger(next: warningLogger)
let debugLogger = DebugLogger(next: infoLogger)

let logManager = LogManager(
    debugLogger: debugLogger,
    infoLogger: infoLogger,
    warningLogger: warningLogger,
    errorLogger: errorLogger
)

logManager.log(message: "This is a debug message", level: .debug)
logManager.log(message: "This is an info message", level: .info)
logManager.log(message: "This is a warning message", level: .warning)
logManager.log(message: "This is an error message", level: .error)
