/*
 Command
 - 필요한 파라미터와 함께 요청(request)을 command 객체에 표현할때 사용함.
 - command는 즉시 수행되거나 나중에 사용하기 위해 보류될 수 있음.
 */

protocol DoorCommand {
    func execute() -> String
}

final class OpenCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        "Opened \(doors)"
    }
}

final class CloseCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        "Closed \(doors)"
    }
}

final class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    
    func close() -> String {
        closeCommand.execute()
    }
    
    func open() -> String {
        openCommand.execute()
    }
}

let podBayDoors = "Pod Bay Doors"
let doorModule = HAL9000DoorsOperations(doors: podBayDoors)

doorModule.open()
doorModule.close()
