/*
 Template Method
 - 알고리즘의 단계를 정의하고 이러한 단계 중 하나 이상을 재정의할 수 있음.
 - 실행 순서를 보호하고 구체 타입별로 구현할 수 있는 추상적인 메서드를 제공
 */
protocol Garden {
    func prepareSoil()
    func plantSeeds()
    func waterPlansts()
    func prepareGarden()
}

extension Garden {
    func prepareGarden() {
        prepareSoil()
        plantSeeds()
        waterPlansts()
    }
}

final class RoseGarden: Garden {
    func prepare() {
        prepareGarden()
    }
    
    func prepareSoil() {
        print("prepare soil for rose garden")
    }
    
    func plantSeeds() {
        print("plant seeds for rose garden")
    }
    
    func waterPlansts() {
        print("water the rose garden")
    }
}

let roseGarden = RoseGarden()
roseGarden.prepare()
