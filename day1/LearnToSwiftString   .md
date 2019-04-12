# Learn To Swift String



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





