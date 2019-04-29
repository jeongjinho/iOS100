# earn To Swift String



스위프트의 `String` 타입은 흔히들 값타임이라고 생각합니다. 그래서  스택에 저장된다고 생각할 수 있습니다. 

근데 사실 `String`타입은 스택에 저장될 수도 있고 되지 않을 수도 있습니다.

우리가 만든 고정 문자열의 크기가 3바이트 이하라면 스택에 저장될 것입니다. 하지만 3바이트라도 Objective -c의 `NSString` 문자열을 갖는다면 스택이 아닌 힙영역에 저장됩니다. 문자열이 길다면 힙에 저장되는 것이고요..



즉 힙영역에 저장되기 때문에 레퍼런스카운팅이 되는 것이죠… (그럼 값타입에 이점이 없자나..)



하나의 예제를 보겠습니다.

```swift
struct Point { 
    var x: Float
    var y: Float
}
```



이 코드에서 Point는 구조체이기 때문에 값타입입니다.



```swift
struct Point { // 값타입
    var x: Float // Float 값타입
    var y: Float // Float 값타입
}
```

모두가 값타입..

스택에 아래처럼  저장됩니다.

| Point |
| :---: |
|   x   |
|   y   |

스택에 저장되었기 때문에 레퍼런스 카운팅을 할 필요가 없죠. 결과적으로 힙보다 메모리에 대한 이점이 생겼습니다.



그럼 다음 예제를 보시죠 



```swift
struct Animal { // 값타입
    var name: String // String 값타입이긴한데 내부적으로 레퍼런스타입을 가지고있다...
    var height: Float // Float 값타입
    var weight: Float // Float 값타입
}
```

![무제 2.001](/Users/afreecatv/Desktop/무제 2/무제 2.001.jpeg)

젠장 결국 힙영역에서 저장되자나.. 레퍼런스카운팅도 체크하겠네…...

하지만 `Anmal`이 복사될 때 Copy on Write가 적용되기 때문에 복사한다고 해서 큰 문제는 없습니다. 다만 힙영역에 문자열은 바뀌면 쌓이겠죠.. 바뀌기 전까지는 같은 곳을 가리키고 있을 겁니다.

 

문자열 뿐만 아니라 구조체를 비롯한 값타입에  속성에 레퍼런스타입이 속해있다면  또 2개 이상 속해 있다면 

 레퍼런스카운트를 계산하는 오버헤드가 커지게 됩니다 물론  Class보다 말이죠.

![무제.001](/Users/afreecatv/Documents/무제/무제.001.jpeg)

![무제.002](/Users/afreecatv/Documents/무제/무제.002.jpeg)

참조하는 횟수가 많아질 수록 기하급수적으로 레퍼런스 카운팅이 많이 증가하게 됩니당!

간단히?.. 메로리구조에 대해서 보았으니



본격적으로 String에 대해서 알아보겠습니다.



## Use String in My Application

일단 `String` 이 스위프트에서 어떤 특징들이 가지고 있는지 보겠습니다.



- `String` 은  UTF-8로 인코딩되어진다.
- `String` 은 유니코드를 완전히 준수한다/
- `String` 은 잘라 쓸 수 있다.
- `String` 은 `Character` 의 구성으로 이루어져 있다.
- `String` 은 컨테이너이다.
- `String` 은 `NSString` , `NSMutableString` 과 다르다.
- `String` Regex모듈과 Locale모듈을 지원한다.





## Index of strings different from traditional methods

스위프트의 문자열은 내부적으로 Character로 되어 있습니다. 해당 공간에 어떤크기의 문자가 들어오기 때문에 정수값으로 인덱싱이 되지 않습니다.

그래서 startIndex와 endIndex를 사용해야 합니다.

startIndex는 문자열의 처음을 말하고, endIndex는 마지막을 말하는데 여기서  endIndex **마지막 문자열의 다음** 입니다.

```swift
let hallo = "hallo world"
hallo[hallo.endIndex] // error
```



indices는  또 뭔고하니..  문자열에 각 문자하나하나르 이터레이터(반복기)를 사용할 수 있도록 해주는 겁니다.

```swift
for index hallo.indices {
    print("\(hallo[index]) ", terminator: "")
}
//"H a l l w o r l d"
```



또한 문자열에 `insert(_: at)` , `insert(contentsOf:at:)` 를 사용하는데 뭐 쓰임이 많이 있을 거 같으니 반복해서 연습해서 쓰면 좋을 것 같습니다.

```swift
var yolo = "yolo"
yolo.insert("v", at: yolo.endIndex)
yolo.insert(contentsOf:"life is", at: yolo.startIndex)
```



여기를 봤다면 10번 반복!



반대로 지우는 메서드도 있습니다.

바로! `remove(at:)` , `removeSubranage(_:)`  이 두개입니다.



```swift
var nilo = "come by way!"
var removeIndex = nilo.index(welcome.endIndex, offset: -1)
nilo.remove(at: removeIndex)  // !
var removeRange = nilo.index(nilo.endIndex, offsetBy: -3)..< nilo.endIndex
nilo.removeSubrange(removeRange) // come by
```

그냥 하나의 인덱스에 있는 것만 지우면 반환값으로 지운 문자가 반환되지만,   특정문자열을 지울 때는 지워진 현재문자열을 반환해줍니다. 일관성 없구만!!!!



그리고 더 많이 쓰이는 부분 문자열가져오기 이건 알고리즘에도 많이 쓰이니깐 열심히 복습해야해요!

예제 먼저 보시졍!

```swift
var trello = "trello is comportable"
let index = trello.firstIndex(of: " ") ?? trello.endIndex
let firstWord = trello[..<index]
let newTrello = String(firstWord)
// trello
```



여기서 메모리구조를 살펴 볼 필요가 있습니다. 이것도 COW 같은 기능이 있거든요

![image-20190423133629565](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190423133629565.png)

그림은 보면  처음 문자열이 "Hello, world!"를 가리키고 있습니다. 그 다음 서브 스트링이 "hello"를 부분문자열로 가지고 있죠.

그러면 해당 서브스트링은 새로 할당하는 것이 아닌 원래 있던 문자열에 같은 문자열만 참조하고 있습니다.

이걸 새로 할당하려면 서브스트링을 가져와 문자열로 초기화해야 합니다.

뭔 굉장히 복잡한데 그래도 성능 좋게 해준다니깐 잘 쓰겠습니다. 



## Compare String

스위프트문자열은 언어학적의미와 모양이 같으면 동일한 것으로 간주됩니다.

즉 모양은 같지만 언어학적으로 다르다면 다른것! 

```swift
LATIN CAPITAL LETTER A``U+0041``"A"``CYRILLIC CAPITAL LETTER A``U+0410``"А" // 러시아에서A와 미국에서의A가 다르다.
```



### Prefix, suffix

스위프트 문자열은 `hasSuffix(_ : String)` , `hasPrefix(_ : String)` 을 통해서 접미사와 접두사를 비교해 낼 수 있습니다.

```swift
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
```

 

아주 간편합니다.





그 다음 생소하고 어려운 유니코드인데 벌써부터 어렵다..

일단 스위프트문자열이 어디에 저장되면 이게 인코딩되서 들어가는데  이때 인코딩 방식중에 UTF-8, UTF-16, UTF-32 뭐 이런게 있어요.



일단 UTF-8은  8비트로 표현하는 것인데 예제를 보자면

![image-20190423141620762](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190423141620762.png)

그림을 보면 D ~ g까지는  ASCII처럼 1byte로 표현이 되는데(영어) !!이건 3byte로 표현된다, 개모양은 4byte로!

![image-20190423142214873](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190423142214873.png)

UTF -16은 2byte로 표현된다. 16비트로 표현하기 때문에  1byte로도 충분한 영어보다는 한글이나 기타 언어들을 표현하는데 한번에 표현 할 수 있어 좋다 뭐 UTF-8을 많이 쓰긴하지만.





유니코드 스칼라 표현



우리는 문자열의 `unicodeScalars` 프로퍼티를 통해서 유니코드스칼라표현에 접근할 수 있습니다.  이 프로퍼티는  `UnicodeScalarView` 타입인데, 이건 `UnicodeScalar` 타입의 값 컬력션입니다.

각 `UnicodeScalar`   스칼라의 21비트 값을 리턴하는 `value` 프로퍼티가 있습니다. 이 값은  UInt32 값으로 표현됩니다.![image-20190426105927426](/Users/afreecatv/Library/Application Support/typora-user-images/image-20190426105927426.png)



```swift
for scalar in dogString.unicodeScalars {
   print("\(scalar.value) ", terminator: "")
}
```

여기서  !! 같은 경우는  16진수 203C 에 유니코드스칼라값인 U+203C에 해당하는 10진수로 변환된 8252가 나오게 됩니다.

`value`속성 을 쿼리하는 대신에 각 `UnicodeScalar`값을 사용하여 `String`문자열 보간법과 같은 새로운 값 을 생성 할 수도 있습니다 .

```swift
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
// D
// o
// g
// ‼
// 🐶
```

