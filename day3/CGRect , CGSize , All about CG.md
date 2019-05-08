# CGRect , CGSize , All about CG

이번에 CG접두사가 붙은  클..아니 구조체를 알아보겠습니다.

대표적인 것들 중엔 CGRect, CGSize, CGPoint

CG는 CoreGraphics의 약자입니다. 즉 그래픽쪽을 다룰 때 사용한다는 말이겠죠.





먼저 살펴볼 것은 CGPoint입니다.  2차원에 좌표를 표시할 때 사용합니다. (x,y)으로 저장할 수 있는 자료구조입니다.

### CGPoint

```swift
let originPoint = CGPoint(x: 10, y: 10)
```

이런 식으로 말이죠 

만약 좌표값을 (0,0)을 주고 싶을 땐  별로의 생성자를 치지않고도 할 수 있는 방법도 있습니다.

```swift
let zeroPoint = CGPoint.zero // (0,0)
```

코드의 가독성도 좋고 짧아졌습니다. 

 저는 이 자료구조를 차트를 만들 때나 지도를 만들 때 많이 쓰지 않을까 싶네요

### CGSize

CGSize는 2차원에서의 크기를 나타날 때 사용하는 자료구조입니다.  가로,세로를 말하죠



```swift
let rectagleSize = CGSize(width: 50, height: 50)
let zeroSize= CGSize.zero
```



정사각형의 사이즈를 만들었습니다. CGPoint 와 마찬가지로 zero라는 속성을 사용할 수 있습니다.



이번엔 잘쓰이지는 않지만 알고 있으면 좋을 구조체입니다.

### CGVector

```swift
let pA = CGPoint(x: 2, y: 3) // Point A(2, 3)
let pB = CGPoint(x: 7, y: 8) // Point B(7, 8)
let vecAB = CGVector(dx: pB.x - pA.x, dy: pB.y - pA.y) // Vector from A to B
print(vecAB) // CGVector(dx: 5.0, dy: 5.0)
```

<https://stackoverflow.com/questions/38030251/how-is-a-swift-cgvector-created-with-dx-and-dy-derivative>



### CGRect

```swift
let backgroundView = UIView.init(frame: CGRect(x:0, y: 0, width: 10, height: 10))
```

즉 2차원이 UIView의 좌료 및 크기를 를 잡아줄 때 사용합니다. 



간단히 CGRect가 어떻게 이루어져 있는지 보자면

```swift
struct CGRect {
    public var origin: CGPoint
    public var size: CGSize
    public init()
    public init(origin: CGPoint, size: CGSize)
} 
```

구조체로 되어 있으면서, 위에서 살펴본 CGPoint와 CGSize를 속성값으로 가지고 있습니다.



#### Bounds vs Frame