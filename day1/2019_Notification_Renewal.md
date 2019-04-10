# Notification_ReNew



이번 알람개편을 작업하면서 쓰인 기술이나 아키텍쳐, 그리고 코드 특징을 설명



### Architecture

- MVC

  코코아터치 프레임워크의 기본구조인 MVC를 따랐습니다



### Design Pattern

- Observer Pattern

  네트워크에서 받아온 데이터를 데이터클래스로 변환 후, 해당 데이터클래스를 뷰컨트롤러에서 구독하고있는 곳에 바인딩하여 데이터의 변화에 반응할 수 있도록 사용하였습니다.

  ```swift
  self.alarmList.bind { [weak self] in
      guard let `self` = self else { return }
      if $0.data.count == 0 { // 받아온 데이터가 갯수가 0개라면 비어있는 UI표시
          self.setupEmptyUI()
          self.removeRefreshControll()
      } else {//받아온 데이터가 갯수가 1개 이상이라면 빈UI 제거 후 상단 리프레쉬컨트롤 추가 
          if self.tableView.viewWithTag(100) != nil {
              self.tableView.backgroundView = nil
              self.setupRefreshControll()
          }
      }// 상단 모두읽기 버튼을 활성화 또는 비활성화 설정 코드
      self.isEnableAllRead() 
      self.refreshControl.endRefreshing()//데이터 불러왔으니 인디케이트 뷰 끝내기
      self.tableView.reloadData() // 해당 값에 대한 테이블류에 반영하기위해서 리로드해줍니다.
      }
  ```

   해당 바인딩 기법은 지금 이대로도 문제는 없으나 기존 앱에서 쓰고있는 Rxswift으로도 바인딩이 가능하므로 향후 바꿀 수 있습니다.

- Delegate Pattern

  테이블 뷰를 사용하면서 애플에서 제공하는 데이터소스와 동작에대한 델리게이트를 준수하여 구현 하였습니다.

  



## Working Class 

####  Name : AFNotificationListViewController

##### 	- 용도 : 알람리스트 뷰를 제어하는 역할의 클래스입니다.

​	코드 : 해당 클래스에서 데이터가 없을 시 보여주는 빈화면을 만들어 주는 코드가 있습니다.

​	이 코드를 뷰클래스로 옮겨서 만들고 프로퍼티를 가지고  hiddden/nonHidden처리하는 것이 더 좋아 보입니다. (xib로!)

 	알람리스트에  기능과 동작이 더 추가된다면 코드가 많이 복잡,난잡해질 수 있기 때문에 코드가 어느정도 늘어나기난다고 판단하면 뷰바인딩과 이벤트를  다른클래스에서 제어할 수있도록 하여 뷰컨트롤러의 무거워짐을 줄여야 할 듯 합니다. 아직은 괜찮습니다.



####  Name : Alarm

##### 	- 용도 : 알람데이트를 서버에서 가져올 때 쓰이는 데이터 클래스입니다.

####  Name : AFNotificationlistApiClient

##### 	- 용도 : 알람리스트의 데이터를 불러오고 알람리스트 화면에서 일어나는 인터렉션에 대한 동작을 서버에 반영할 때 쓰이는 동작을 관리하는 클래스입니다.

```swift
class AFNotificationlistApiClient {
    enum  ApiAction: String {
        case read = "read"
        case readAll = "read_all"
        case delete = "delete"
        case deleteAll = "delete_all"
        case notificationDisable = "notification_disable"
    }
}    
```

API 중 동작( 삭제, 읽음)에 대한 동작들은 한 API에서 액션타입만 파라미터로 넣어주면 되기 때문에  액션에 대한 값을 내부에 열거형으로 가지고 있도록 하였습니다. 네트워크 클래스안에 넣어 놓은 이유는 해당 네트워크에서 쓰는 열거형이라는 것을 알려주기위해서 입니다. 

####  Name : NotificationListTableViewCell

##### 	- 용도 :  알람리스트에 있는 테이블뷰에 각 요소들을 보여줄 수 있는 뷰클래스입니다

 - 코드 :

   1) 이 클래스에서 복잡한 로직이  이름이 포함되어있는 노티텍스트에 닉네임을 찾아내는 것입니다. <닉네임> 이런식으로 닉네임이 표시되어있는데  태국어로 번역해서하면 닉네임이 무조건 앞이 아니라 중간에 오고, 닉네임이 노티텍스트에 나오는 문구와 겹치게 되면 ex) "시작"시작했습니다. 이럴경우 어떤게 닉네임인지 몰라 강조처리를 할 수 없게 됩니다.

   그래서 <사이에> 닉네임을 넣어주어 서버에서 전달 됩니다.

   그래서 <닉네임>을 찾고 < 다음 인덱스와 > 이전 인덱스를 구해서 해당 닉네임을 구하고 

   <>를 지우고 다시 넣어주는 코드가 있습니다. 그렇기 때문에 코드가 길어집니다. 

   

   ex)  태국어 -  시작합니다. "시작"이

   ​	서버   시작합니다. "<시작>"이

   ​	1.before =   시작합니다.

   ​	2. after =  이

   ​	3. 워드  = <시작>  -> <> 삭제

   ​	4. 조합 =   before + 워드 + after

    이런식입니다.

   ```swift
   private func configureContentText(fromNickName: String, notificationMessage: String, headText: String) {
       //서버   시작합니다. "<시작>"이
           let highligtNickName = String.init(format: UIMatrix.checkNickNameString, fromNickName)
               let fullRange = (notificationMessage as NSString).range(of: fromNickName)
               if fullRange.length == 0 {
                   var noti = notificationMessage
                   noti.append(headText)
                   self.contentLabel.text = noti
               } else {
                   let range = (fromNickName as NSString).range(of: fromNickName)
                   var front = ""
                   var after = ""
                   // ex) 	1.before =   시작합니다.
                   if highligtNickName.startIndex != notificationMessage.startIndex {
                       front = String(notificationMessage[String.Index(encodedOffset: 0)..<notificationMessage.index(before: highligtNickName.startIndex)])
                   }
                   //  2. after =  이
                   if highligtNickName.endIndex != notificationMessage.endIndex {
                       let index = String.Index.init(encodedOffset: highligtNickName.endIndex.encodedOffset - 1)
                       after = String(notificationMessage[notificationMessage.index(after: index)...])
                   }
                   // 사이에 들어갈 닉네임 3. 워드  = <시작>  -> <> 삭제
                   let wordAttributedString = NSMutableAttributedString(string: fromNickName)
                   wordAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(rgb: 0x4279ff), range: range)
                   wordAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 12.0), range: range)
                   // 4. 조합 =   before + 워드 + after
                   let frontAttributedString = NSMutableAttributedString()
                   frontAttributedString.append(NSMutableAttributedString(string: front))
                   frontAttributedString.append(wordAttributedString)
                   var contentText = headText
                   if headText != "" {
                       contentText = ": " + headText
                   }
                   frontAttributedString.append(NSMutableAttributedString(string: after))
                   frontAttributedString.append(NSMutableAttributedString(string: contentText))
                   self.contentLabel.attributedText = frontAttributedString
               }
       }
   ```



2)

코드 중에 각 노티 타입별 뱃지아이콘이 다르게 보여집니다. 이것을 로컬 이미지를 넣어놓고 불러오고 있는데 뱃지아이콘이 38개입니다.( 더 늘어날 수도..) 근데 이걸 모두 로컬에 저장하는게 맞는냐는 잘 모르겠습니다. 또한 로컬이미지 각각을 불러오는데 리소스에 대한 부하가 없느냐도 한번 고려해봐야겠습니다. 실제 다른프로젝트에서는 큰 용량의 로컬이미지를 다수의 테이블뷰셀로 불러올때 부하가 있어서 문제가 있었습니다. (뭐 뱃지는 용량이 작아서 상관없긴하겠지먄)

3)

테이블뷰 스와이프 버튼 노출 시 나오는 버튼의 이미지와 타이틀이 있는데 셀의 높이가 작으면 아이콘만 보여지고 타이틀이 사라지게 됩니다. 

이번 작업에서 디자인은 가변적인 셀 높이라서  높이가 꽤 있는 셀에서는 아이콘,타이틀 둘다 보여지게 되지만 그렇지않은 셀(게시글이 한줄) 이라면 아이콘만 보여집니다. 

그래서 아이콘과 타이틀을 이미지로 렌더링하여 합쳐서 텍스트 와 아이콘 둘다 합친 이미지로 만들어 스와이핑 이미지로 넣었습니다. 

근데 이미지를 만드는과정에  좌표값을 구하는게 아직 정확히 이해가 가지않아 추후 이해한다음 다른곳에서도 쓰일 수 있는 익스텐션 및 유틸메서드로 만들면 좋겠습니다.



4) SwiftJSON  써보기

바로전엔 swift에서 제공하는 Codable protocol을 사용했는데

역시 라이브러리라 그런지 편하긴 이게 더 편한데

맘대로 구성해서 쓰기에는 ( 예외처리 라든가)는 Codable이 좋은 것 같습니다.

이것도 앱네 라이브러리가 있으니 적극 활용하기인데 Codable마스터하면 이걸로 하기…….. 

