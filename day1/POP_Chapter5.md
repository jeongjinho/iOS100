# Object-Oriented Programming 

저는 대학교에서 처음 객체지향 프로그래밍을 배웠습니다.  그때는  간략하게  C++로 배웠죠.

C++  프로그래밍 언어는 여전히 계속 새롭게 적응중이에요. 사실 그 언어의 초판은 내가 소개하기 3년 전에야 발매되었습니다. 객체지향 프로그래밍 패러다임은 내가 과거와 그 당시에 배운 것은 꽤 압도적으로 보였습니다.C++로 객체지향 프로그래밍을 소개받았지만, 훨씬 후에 자바를 배울 때까지는 정말로 그것으로 진지한 발전을 하지 않았습니다.



이 챕터에서 우리는 아래에 있는 것들을 배울 것입니다.

- 어떻게 스위프트가 객체지향프로그래밍 언어로서 사용되어 질 수 있는지
- 어떻게 객체지향적인 방법으로 API을 개발 시킬건지 
- 객체지향적인 설계의 이점은 무엇인지
- 객체지향프로그래밍의 단점은 무엇인지

이책을 읽는 동안 우리 . 프로토콜지향언어로서 사용하기 전 어떻게 스위프트가 객체지향프로그래밍언어로 사용되는지 생각해볼 필요가 있습니다.

객체지향프로그래밍을 잘 이해하는 것은 프로토콜지향프로그래밍을 이해하는데 도움을 주고,  프로토콜프로그래밍의 설계문제를 해결하는것에 대한 영감을 줍니다.



## What is object-oriented programming

 

객체지향프로그래밍은 설계 철학입니다. 객체지향프로그래밍언어로 쓰여진 어플리케이션은 파스칼과 C와같은 절차지향언어와는 근본이 다릅니다.

절차지향언어는  컴퓨터에게 단계적으로 어떤 일을 해야하는지 알려주지만, 객체지향프로그래밍은  모든 것이 객체로 이루어져 있습니다.  이것은 배우 분명한 이름을 가지고 보면 꽤  분명해보이지만 기본적으로, 우리가 객체지향프로그래밍을 생각했을 때 우리는 객체에 대해서 생각할 필요가 있습니다.

객체는  객체의 속성에 대한 정보를 포함하고 있는 데이터 구조입니다.  프로퍼티의 형식과 동장 객체의 따라 발생수행되는 것에서,

객체는  동사로 고려되어질 수 있습니다.  이 객체는 실제세계 또는 가상 세계에 있는 객체를 말합니다. 만약 우리가 주변에 세계에 객체를 본다면 이 객체들은 가상세계에서 모두 객체지향프로그래밍으로 행동과 속성들이 모델링 되어질 수 있습니다.

저는 이 챕터를 쓰면서,   밖에 많은 나무.유리잔, 저의 강아지, 그리고 마당의 펜스를 봤습니다.  모든 사물들은 객체로서 모델링되어질 수 있습니다.  저는 가자좋아하는것이 에너지드링크를 마시는 것입니다.  이 에너지드링크는  졸트콜라입니다. 얼마나 많은 사람들이 졸트를 기억하는지 확실하지 않지만, 나는 졸트가 없었다면 대학을 졸업하지 못했을 겁니다.  졸트의 캔은  크기나 카페인의양 온도 사이즈같은 속성들과 함께 객체로 모델링되어질 수 있습니다. 우리는 졸트의 캔들을  차갑게 유지시킬 수도 있습니다.  이 차갑게하는 기계는 객체로서 모델링 되어질 수 있습니다.  이것은 온도,졸트의 캔, 캔의 최대 개수등과 캔을 추가하고 삭제할 수있는 행동을 말이죠.

객체의 행동과 속성을 정의하는 것은 매우 좋습니다. 그러나  어떻게 객체사이에 상호작용이 일어나는지 이해할 필요가 있습니다.

 우리가 졸트콜라의 캔을  쿨러에 안에 위치시킨다면 , 그 후부터 차가워지기 시작할 것입니다. 그러나 만약 우리가 쿨러의 온도를 우리의 방 온도에 맞춰놓는다면  쿨러에는 얼음이 없겠죠.  이 상호작용을 이해하는 것은 우리의 현재 객체를 모델링하는데 매우 중요합니다.

컴퓨터 어플리케이션에서 우리는  어플리케이션이 어떤 속성과 행동을 객체로부터 기대하는지 말하는 청사진 없이는 객체를 생성 할 수 없습니다.  이 청상지은 클래스의 형태를 가지고 있습니다.  클래스는  우리를 행동과 속성을 하나의 단일 타입으로  모델화하여 캡슐화할 수 있도록 제공합니다. 우리는 이것을 코드를 통해서 표현 할 수 있습니다.

우리는 우리의 클래스를 인스턴스 생성하여 초기화 할 수 있습니다. 우리는 보통 초기값을 설정하는 이니셜라이져을 사용합니다.  우리는 클래스의 인스턴스를 한번만 생성 하므로서,  우리의 코드에서  사용 할 수있게 됩니다.

클래스의 객체지향프로그래밍에서 중추적인 역항을 하는 것을 이해하는게 매우 중요합니다. 클래스나 객체없이 클래스를 생성한다면 객체지향 프로그래밍이 아닙니다. 클래스가 참조 유형이고 달리 정의되지 않는 한 수퍼 및 서브 클래스를 가질 수 있다는 것도 마찬가지로 중요합니다.

객체지향의 프로그래밍의 모든 표현은 다 좋습니다. 하지만 실제 코드보다 그 개념을 더 잘 보여주는 것은 없다. 코딩하기 전까지 말이죠. 우리는  약간의 요구사항을 정의하는 것이 필요합니다. 이 챕터에서,  우리는 어떻게 객체지향방법에서 비디오게임에 대한자전커타입을 설계하는지 보여줄 것입니다.

이 다음 챕터에선, 우리는 어떻게 이 타입을 프로토콜 지향적인 방법으로 구현하지는도 볼 것이에요. 자 자전거타입의 요구사항을 봐보도록 하죠. 

## Requirements for the sample code

우리가 어플리케이션을 개발할 때, 보통 우리가 작업에 필요한 요구사항을 맞추는 경우가 일반적입니다.  우리의 샘플 프로젝트는 

아래의 자전거타입에 대한 요구사항을 리스트를 보여드리도록 하겠습니다. 우리는 이대로 구현하면 되는거죠.

- 우리는 자전거를 3개의 카테고리로 나눌 것 입니다. 바다, 산, 그리고 평지, 자전거는 여러개의 카테고리를 가질 수 있습니다.
- 자전거는 움직일 수 있으며, 우리가 그들의 카테고리 안에있는 타일에 있을 때 그쪽으로 급격하게 이동 할 수도 있습니다.
- 자전거는 맞지않는 타일로 움직이거나 급격하게 옳길 수 없슨디ㅏ.
- 자전거의 타격 지점이 0에 도달하면 차량은 불능 상태로 간주됩니다.. 우리가 순환시킬 수 있는 단일 배열에 모든 활성 차량을 유지해야 할 것입니다.



이번 챕터의 디자인에 따라서,  오직 약간씩만 자전거의 설계에 대해서 설명할 것입니다. 그러나 우리는 자전거 타입의 갯수가 이 챕터에서 계속해서 증가한다는 것을 알고 있습니다.  우리는 자전거타입에 대해서 많은 로직을 만들진 않을 것 입니다. 우리의 초점은 자전거의 움직임과 급격한 방향전환을 구현하는 코드가 아닌 설계에 초점이 맞춰져 있기 때문입니다. 

자 이제 우리의 자전거를 객체지향적인 방법으로 디자인해보도록 하죠!

## Swift as an object-oriented programming language

스위프트는   객체지향적인 방법을 개발적으로 모두 제공하고 있습니다.  스위프트 2.1이전까진   자바나 C#처럼 객체지향적인 언어에 가까웠습니다.  이 섹션에서,  우리는 자전거 타입을 객체지향적인 방법으로 설계하므로서, 객체지향적 방법의 장점과 단점 둘 다 알아볼 것입니다. 

우리가 코드르 보기전에, 매우 간단한 다이어그램으로 우리가 어떤 클래스 계층을 구성할 것인지 보겠습니다. 객체지향 설계에서, 우리는 비슷한 관계의 클래스를 그룹으로 묶어 계층을 사용할 것입니다.  스위프트가  단일 상속 언어라서,  클래스는 오직 하나으 슈퍼클래스만 가질 수 있습니다.  계층도에서 루트클래스는 오직 슈퍼클래스가 없는 클래스입니다.



저는 보통 매우 간단하게 만든 다이어그램을 보여주는것으로부터  시작합니다.  이것은 우리에게 클래스 게층도가 저의 생각속에서 어떻게 그려지는지에 대한 도움을 줄 것입니다.  아래 다이어그램은 객체지향적인 디자인에 대한 클래스 계층도를 보여줍니다. 

![image-20190514121656211](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190514121656211.png)



이 다이어그램은 우리가 `Vehicle`이라는 이름의 슈퍼클래스로부터  5개의 서브클래스를 가지는 것을 보여줍니다.(Tank,Amphilbius, Submarine,jet 그리고 Transfomer) 클래스 계층도를 보면,  각 서브클래스는  슈퍼클래스의 모든 메서드와 프로퍼티를 상속받고 있습니다.  그러므로  Vehicle에서 구현된 탈것에 대한 공통 프로퍼티 코드는 모든 서브클래스에서 상속받게 됩니다.

우리는  3개의 카테고리(산,평지,바다)를 우리의 요구사항에서 생각해봐야합니다., 우리는  중간 계층에서 산,바다,평지 탈것을 을 슈퍼클래스로서 분리한 거대한 클래스 계층도가 필요하다고 생각할 것입니다. 이것은   각각의 슈퍼클래스 카테고리 분리할수 있도록 해줍니다. 그러나 이것은 요구사항에 맞추는 불가능합니다.  이유는 어떠한 탈것타입은 여러개의 카테고리타입을 얻을 수 없기 떄문입니다. 왜냐면  스위프트는 단일상속 언어를 이기때문입니다. 각각에 클래스는 하나의 슈퍼클래스만 상속받을 수 있습니다.  이것은 예제에서 만약 우리가 산과, 바다를 분리한 슈퍼클래스를 만든다면 Amphibious클래스는  둘 중하나의 타입의 서브클래스만 될 수 있다는 것을 뜻합니다.두개는 안되죠!. 아래 그림을 보면,



![image-20190514133914934](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190514133914934.png) 

스위프트는 단일 상속 언어이므로, 우리는 오직  모든 탈것 클래스에서 하나만 상속 받을 수 있습니다.   슈퍼클래스는 3가지 카테고리 각각에 필요한 코드를 포함해야 합니다. 이와 같이 하나의 슈퍼 클래스를 갖는 것은 슈퍼 클래스가 매우 비대해질 수 있기 때문에 객체 지향 설계의 단점 중 하나입니다.

우리는 우리의 객체지향 디자인 을 TrratinType의 열겨형 을 갖추므로서 시작할 수 있습니다.  이것은 다른 타입의 탈것과 움직임들을 정의하는데 사용됩니다.  `TerrainType` 열거형 은 아래처럼 정의됩니다.

```swift
enum TerrainType {
    case land
    case sea
    case air
}
```



자 이제 우리는  `Vehicle` 슈퍼클래스와 프로퍼티들을 정의 할 것 입니다. 

```swift
class Vehicle {
    fileprivate var vehicleTypes = [TerrainType] ()
    fileprivate var vehicleAttackType = [TerrainType] ()
    fileprivate var vehicleMovementTypes = [TerrainType] ()
    fileprivate var landAttackRange = -1
    fileprivate var seaAttackRange = -1
    fileprivate var airAttackRnage = -1
    fileprivate var hitPoints = 0
}
```



우리는 7개의 프로퍼티를 정의하는 것으로부터 시작했습니다. 이 중 3개의 프로퍼티는 `TerrainType` 타입의 배열입니다.

이 세개의 배열은  Vehicle타입의 트랙을 유지 할 것 입니다.

이러한 세 가지 배열은 차량 유형(차량 유형 배열), 차량이 공격 가능한 지형 유형(차량 Attack 유형 배열), 차량이 이동할 수 있는 지형 유형(차량 이동)을 추적하는 배열들입니다.

다음 세개프로퍼티(landAttackRange, seaAttackRange,airAttackRange)는  각각의 지형의 따라 차량의 공격범위를 나타냅니다. 마지막 프로퍼티는 차량의 공격포인트를 추적하기위한 프로퍼티입니다.

이 각 프로퍼티의 참조에대해서,  `hitPoints` 는 제외합니다.  그러나 서브클래스는  슈퍼클래스에 있는 상수를 변경하거나 새로운 값을 넣을 수 없습니다. 이 것은 스위프트의 접근제한이 이 세개의 프로퍼티에 접근할 수 없도록 하기 때문입니다.

우리는 서브클래스에서 분리해야하는 것이 필요하기 때문에 fileprivate 변수들로 정의했습니다.  그러나 우리는 외부의 이것들을 정을 하기 원하지 않습니다.  이건 접근제어가 스위프트3에서 소개되었고,  같은 소스파일에서만 접근하도록 되어있기 때문입니다. 

서브클래스는 물리적으로 같은 파일안에 있지못한다면 3개의 프로퍼티에 접근할수 없게됩니다.  이렇게 된다면 한 파일에 많은 코드가 들어가게 됩니다.  그러나 객체지향설계에서, 이것은 3개의 프로퍼티가 다른타입의 인스턴스에 의해서 변경되는 일을 막아주는 최고의 방법입니다. 만약 우리가 몇 가지 이상의 차량 종류를 가지고 있다면, 우리는 아마도 차량 구현을 별도의 파일로 만들 수 있도록 접근 제어장치를 내부로 변경할 것이다.

3개의 프로퍼티는 fileprivate로 이루어져 있으므로, 우리는 프로퍼티 값에 대한  겟 메서드를 생성해야합니다.  우리는 차량이 공격과 이동을 해야하기 때문에 지향의 타입이 무엇인지 보기위해서 메서드도 만들어 줘야합니다.  자 메서드를 보시죠.

```swift
func isVehicleType(type: TrrainType) -> Bool {
    return vehicleTypes.contain(type)
}
func canvehicleAttack(type: TerrainType) -> Bool {
    return vehicleAttackTypes.contain(type)
}
func canVehicleMove(type: TerrainType) -> Bool {
 return vehicleMovementTypes.contains(type)
}
func doLandAttack() {}
func doLandMovement() {}
func doSeaAttack() {}
func doSeaMovement() {}
func doAirAttack() {}
func doAirMovement() {}
func takeHit(amount: Int) { hitPoints -= amount }
func hitPointsRemaining() ->Int { return hitPoints }
func isAlive() -> Bool { return hitPoints > 0 ? true : false }
```

  

`isVehicleType`메서드는  `TerrainType` 타입의 파라미터 하나를 받아서,  만약 `VehicleType` 배열에 해당 지형이 있다면 True, 없다면 false를 반환합니다. 이것은 외부에서 어떠한 타입에 대한 차랴을 볼 수 있을 때 사용합니다.

다음 두개의 메서드 또한 하나의 `TerrainType`타입의. 파라미터로  공격타입의 차량인지, 이동타입의 차량인지 알 수 있도록 해줍니다. 이 두개의 메서드 공격이 가능한지, 이동이 가능한지 알 수 있습니다.



다음 6개의 메서드는 다른 지형에 따른 움직임과 공격에 대한 정의를 하고 있습니다.   그 다음 두개의 메서드는  차량이 공격당하거나 현재 공격당한 포인트를 반환해주는 메서드입니다.  마지막 메서드는  만약 차랑이 여전히 살아있는지 아니면 불능인지 알 수있도록 해주는 메서드입니다. 

이 설계의 가장 큰 이슈는 초기부터 말했던, 만약 우리가  즉각적인 프로퍼티 접근을 막기위해서 fileprivate 접근제어수준을 사용한다면  모든 서브클래스는 같은 물리적인 파일안에 있어야한다는 것입니다.  그 파일에는 거대한 클래스들로 가득차있을 것 입니다.  우리는  그런 소스파일은 원하지 않을 것 입니다.  이것을 피하기위해서, 우리는 프로퍼티의 접근권한을 internal로해 설정할것 입니다. 하지만 이것은 다른 타입이 이 타입의 프로퍼티의 속성을 바꾸는 것을 예방하지 못합니다. 이 주요한 객체지향설계의 단점은  우리가 외부에 타입을 즉각적으로 접근하지못하도록 하고싶기 때문입니다.

또 다른 이슈는  우리는 차량의 공격과 이동을 하기위해서 각각 의 다른 Terrain Type을 알 수있는 메서드를 제공해야한다는 것입니다.  비록 대부분의 차량이 다른 지형을 공격하고 이동할 수 없을지라도, 메서드 구현에 코드는 없지만, 외부 코드는 여전히 공격 및 이동 방법을 호출할 수 있을 것입니다. 예를 들어 비록 Submarine 탕비이 바다타입이지만 외부에서는 해양과 공중에서  움직이는 것과 공격하는 메서드를 호출 할 수 있습니다.

슈퍼클래스들은 이러한 단일 상속으로 인하여 코드가 부풀어져 있습니다.  부푼클래스는  매우쉽게 실수를 저지를 수 있도록 하며, 것이 가지고 있어야 하는 기능성을 갖거나 부인해서는 안 되는 유형의 기능성을 부여합니다.

예를 들어잠수함이 분명히 할 수 없는 공중 공격 능력을 주는 잠수함 유형의 에어어택렌지 속성을 설정하는 것은 매우 쉬울 것입니다. 

이 예제서는  우리는 오직 매우작은 차량의 기능중 약간만 정의할 것입니다. 

자 이제 어떻게 서브클래스 Tank, Amphibius, Transformer 클래스가 생성되어졌는지 알아보도록 하겠습니다. 먼저 탱크 클래스입니다.

```swift
class Tank: Vehicle {
    override init() {
        super.init()
        vehicleType = [.land]
        vehicelAttackTypes = [.land]
        vehicleMovementType = [.land]
        landAtttackRange = 5
        hitPoint = 68
    }
    override func doLandAttack() {
        print("Tank Attack")
    }
    override func doLandMoveMent() {
        print("Tank move")
    }
}
```

 이 탱크 클래스는  차랑클래스의 서브클래스입니다.  그리고 우리는 이 클래스를  디폴트 생성자를 오버라이딩했습니다. 

이 생성자에서, 우리는 여러개의 프로퍼티를 세팅해줬습니다.  이것을 통해서 탱크는 랜드 차량이며 랜드타일에서 공격과 이동을 할 수 있게 하였습니다. 

 차량의 타입에 트랙을 배열로 사용하므로서,  배열을 사용하여 클래스의 차량 유형과 차량이 이동하고 공격할 수 있는 지형 유형을 추적하는 것은 이 객체 지향 설계의 또 다른 문제다.

또한 경험많은 개발자는 이것이 매우 쉽게 배열에 잘못된 값이 들어갈 행동을 할 수있다는 것을 알 수 있습니다.

탱크클래스안에서, 우리는 doLandMovement()와 doLandAttack()이라는 메서드를 오버라이드했습니다.  탱크클래스는  육상 차량입니다. 우리는 다른 공격과 이동에 대해서 메서드를 오버라이드 하지 않았기 때문에 탱크는  해상이나 공중에서 이동이나 공격을 할 수 없을 겁니다.  비록 우리는 이 메서드를 오버라이드 하지않았지만,  이 오버라이드하지않은 메서드들은 여전히 탱크클래스에 남아있게 됩니다. 왜냐면, 챠량클래스로부터 상속되어있기 때문입니다.  이 메서드는 외부에서 접근하는것을 예방할 방법이 없습니다.

이제, Amphibious 와 Transformer를 보도록 하죠. 이 클래스들은 탱크 클래스와 매우 비슷합니다.  다양한 지형타입을 공격하고 움직이는 것을 제외하곤 말이죠. 우리는 amphibious클래스를 먼저 볼 것 입니다.  이 클래스는  지상과 바다 지형을 모두 공격하고 이동 할 수 있습니다. 

```swift
class Amphibious: Vehicle {
    override init() {
       vehicleTypes = [.land, .sea]
       vehicleAttackTypes = [.land, .sea]
       vehicleMovementTypes = [.land, .sea]
       landAttackRange = 1
       seaAttackRange = 1
       hitPoints = 25
     }
     override func doLandAttack() {
       print("Amphibious Land Attack")
    }
    override func doLandMovement() {
      print("Amphibious Land Move")
    }
    override func doSeaAttack() {
      print("Amphibious Sea Attack")
    }
    override func doSeaMovement() {
      print("Amphibious Sea Move")
    }
 }
```

 

이 Amphibious클래스는 보기에 탱크클래스와 매우 유사합니다.  두개의 클래스가 다른점은  탱크타입은 지상에서만 가능하고 amphibious타입은  지상, 해상 둘다 가능한 유닛이라는 점입니다.   이 유닛이 지상과,해상 둘다 라면,  우리는 지상의 공격과 이동을 해상의 공격과 이동 메서드처럼 오버라이드해줘야합니다.  우리는 또한 vehicleType,vehicleAttackType, vehicleMovementTpy 배열에 지상과 해상으로 추가해야합니다.



자 이제  Transformer 클래스를 보겠습니다. 이 타입은  3개의 지형에서 움직이고 공격할 수있는 능력이 있습니다.

```swift
class Transformer: Vehicle {
     override init() {
       super.init()
       vehicleTypes = [.land, .sea, .air]
       vehicleAttackTypes = [.land, .sea, .air]
       vehicleMovementTypes = [.land, .sea, .air]
       landAttackRange = 7
       seaAttackRange = 10
       airAttackRange = 12
       hitPoints = 75
     }
     override func doLandAttack() {
       print("Transformer Land Attack")
     }
     override func doLandMovement() {
       print("Transformer Land Move")
     }
     override func doSeaAttack() {
       print("Transformer Sea Attack")
     }
     override func doSeaMovement() {
       print("Transformer Sea Move")
    }
    override func doAirAttack() {
      print("Transformer Air Attack")
    }
    override func doAirMovement() {
      print("Transformer Air Move")
    }
}
```

 

TransformerType은, 우리가  3개의 움직임과 공격을 다 오버라이들했습니다.  우리는 3개의 지형의 에대해서 vehicleTypes, vehicleAttackTypes, vehicleMovementTypes 배열에 다 넣어줬습니다.

자 우리는 차량타입을 만들었습니다. 어떻게 사용되었는지 한번 보세요. 처음 요구사항 중 하나는  하나의 배열에서 모든 차량타입의 인스턴스를 유지하도록 하는 것이였습니다.

이것은 우리에게  모든 활동가능한 차량과 행동이 필요랄 때 루프를 돌수있도록 합니다.

다형성은 다형성은 그리스어인 폴리(다수의 경우)와 모르프(형식의 경우)에서 유래합니다.  컴퓨터사이언스에서는 우리는 다형성은   우리가 여러 타입을 하나의 인터페이스에서 보여줘야할 때 사용합니다.  다형성은 우리에게   다수의 타입에서 통일된 포맷으로 상호 작용할 수있는 상태를 줍니다.

객체지향프로그래밍언어에서, 우리는  다형성을 상속받아 구축할 수 있습니다.   다양한 서브클래스에 의해서 제공된 인터페이스를 통하여  서브클래스들과 상호작용 할 수 있습니다.



자 이제  단일 배열에서 다양한 차량타입의 모든 인스턴스를 유지하고 상호작용을 할 수 있도록 다형성을 사용해봅시다.

 모든 차량타입이 서브클래스가 된 후로ㅡ 우리는 차량타입의 배열을 생성 할 수 있습니다. 그리고  차량타입이나 서브클래싱한 타입이라면 어떠한타입도 해당 인스턴스에 저장할 수 있습니다.



```swift
var vehicles = [Vehicle]()
var vh1 = Amphibious()
var vh2 = Amphibious()
var vh3 = Tank()
var vh4 = Transformer()
vehicles.append(vh1)
vehicles.append(vh2)
vehicles.append(vh3)
vehicles.append(vh4)
```

각각의 인스턴스와 상화작용하기위해서   루프를 돌면서 vehicleType의 인터페이스를 통해서 접근할 수 있습니다.

```swift
for (index, vehicle) in vehicles.enumerated() {
     if vehicle.isVehicleType(type: .air) {
       print("Vehicle at \(index) is Air")
       if vehicle.canVehicleAttack(type: .air) {
         vehicle.doAirAttack()
       }
       if vehicle.canVehicleMove(type: .air) {
         vehicle.doAirMovement()
} }
     if vehicle.isVehicleType(type: .land){
       print("Vehicle at \(index) is Land")
       if vehicle.canVehicleAttack(type: .land) {
         vehicle.doLandAttack()
       }
       if vehicle.canVehicleMove(type: .land) {
         vehicle.doLandMovement()
       }
     }
     if vehicle.isVehicleType(type: .sea) {
       print("Vehicle at \(index) is Sea")
       if vehicle.canVehicleAttack(type: .sea) {
         vehicle.doSeaAttack()
       }
       if vehicle.canVehicleMove(type: .sea) {
         vehicle.doSeaMovement()
} }
}
```



이 코드에서, vehicleypes 배열을 통해서 루프를 돌 수 있고,  isVehicleType(type:)을 통해서  만약 특정한 타입이라면 예상되는 공격과 움직이는 메서드를 호출 할 수 있습니다. 어떤 차량이든 여러 유형의 구성원이 될 수 있으므로 여기서는 if-else 또는 스위치 문을 사용하지 않으며, 차량이 이전 형식과 일치하더라도 유형을 다시 체크합니다.

만약 우리가 오직 공중타입의 유닛의 차량타입의 인스턴스만을 원한다면 결과값을 필터링할 수도 있습니다.  아래 where절과 루프절을 통해서 말이죠.

```swift
for (index, vehicle)in vehicles.enumerated() where
   vehicle.isVehicleType(type: .air) {
     if vehicle.isVehicleType(type: .air) {
       print("**Vehicle at \(index) is Air")
       if vehicle.canVehicleAttack(type: .air) {
         vehicle.doAirAttack()
       }
       if vehicle.canVehicleMove(type: .air) {
         vehicle.doAirMovement()
} }
}
```

이 코드는 isVehicleType(유형:) 방법이 공기 유형에 대해 true로 반환된 경우에만 공격 및 이동 방법을 수행할 수 있습니다.
이 설계는 충분히 잘 작동하지만, 6장에서 보듯이, Swift를 통해 우리는 여기에서 제시된 많은 문제들을 프로토콜 지향적인 설계로 해결할 수 있습니다. 다음 장에서 프로토콜 지향 프로그래밍이 이들을 어떻게 다루는지 볼 수 있도록 객체 지향 설계의 단점을 검토해보도록 하죠.



### Issue with the object-oriented design

객체 지향 설계로 본 문제 중 두 가지는 서로 직접적인 관련이 있었으며, 스위프트가 단일 상속어로서의 결과물이다. 단일 상속 언어는 한 클래스를 한 개 이하의 슈퍼 클래스로 제한하는 언어라는 것을 기억해야합니다.
Swift와 같이 단일 상속 언어를 사용하는 객체 지향 설계는 소수의 하위 분류에만 필요한 기능성을 포함할 필요가 있을 수 있기 때문에 슈퍼 클래스가 비대해지는 결과를 초래할 수 있습니다.. 이것은 Swift가 단일 상속 언어와 관련된 두 번째 문제로 이어지게 되는데, 이것은 유형이 필요하지 않은 기능을 상속 할 수 있기 때문입니다.

우리의 디자인에서, 우리는  세개의 지형에따라 움직이고 공격 할 수 있는 타입이 다르도록 3개의 타입을 포함했습니다.  우리가 주의하지 않으면 이 추가 기능을 갖는 것은 우리 코드에 오류를 일으킬 수 있고, 이런 클래스를 잘못되도록 만드는 것은 쉬울지 모릅니다.

```swift
class Infantry: Vehicle {
     override init() {
       super.init()
       vehicleTypes = [.land]
       vehicleAttackTypes = [.land]
       vehicleMovementTypes = [.sea]
       landAttackRange = 1
       seaAttackRange = 1
       hitPoints = 25
     }
     override func doLandAttack() {
       print("Amphibious Land Attack")
     }
     override func doLandMovement() {
       print("Amphibious Land Move")
     }
}
```

 이 코드를 보면,  우리는 쉽게 vehicleMovementTypes배열을  sea타입 또는 land타입을 포함 시킬 수 있습니다. 그러하 쉽게 실수할수도 있죠.

객체지향설계의 또다른 이슈는 우리가  서브클래스에의해서 맞춰진 슈퍼클래스에서 상수를 생성할 수 없다는 점입니다.  설계에서, 서브 클래스의 초기 설정에서 설정하여 변경하지 않는 몇 가지 특성이 있습니다. 그러나 이러한 상수를 만들 수 있다면 이상적일 것이다. 그러나 서브클래스에서 정의된 상수는 그러한 유형의 하위 등급으로 설정될 수 없습니다.

### Summary

이 챕터에서 우리는 비디오게임과 차량을 객체지향적인 방법인 방법으로 봤습니다. 우리는 다형성을 사용하여 클래스의 계층도를 보고 거기서 몇몇개의 이슈를 보았습니다.  그리고 해당 단점들은 스위프트가 단일상속언어라는데에서 파생되었습니다.

다음챕터에서는 우리는 차량타입을  프로토콜지향적인 방법으로 만들 수 있는지 알아보도록 하겠습니다. 