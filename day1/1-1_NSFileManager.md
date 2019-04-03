# NSFileManager



저번에 제가 파일에 관한 작업들은 대부분 NSFileManager에서 이루어진다고 말씀드렸습니다.

그 중 프로젝트를 진행하면서 자주 쓰일 메서드나 프로퍼티를 소개할까 합니다.



- ### fileExistAtPath

  이 메서드는 해당 Path 즉, 경로에 파일이나 폴더가 있는지 검사하는 메서드입니다. 없다면 `false` 있다면 `true`를 반환합니다.

  ##### 쓰이는곳 - 기본적으로 파일이 있는지 확인하고 생성,삭제,복사 같은 동작을 하기 때문에 많이 쓰입니다.

- ### isReadableFileAtPath, isWritableFileAtPath, isExecutableFileAtPath,isDeletableFileAtPath

  이 메서드들은 읽은 수 있거나, 쓸 수 있거나, 실행할 수 있거나, 삭제할 수있는 지에 대한 여부를 알려줍니다 .

  ##### 쓰이는곳 - 예상하기론 파일의 정렬을 할 때 유용하게 쓰일 것 같네요

- #### createDirectoryAtPath:withInterediateDirectiories:attribute:

  이 메서드에 경로를 넣으면 해당 경로에 폴더가 만들어지게 됩니다.

  그전에 `fileExistAtPath`메서드로 존재하는지 확인 해봐야 겠죠!

- ### removeItemAtPath: error:

  해당 경로에 있는 파일이나 폴더를 지웁니다. 이 메서드도 `fileExistAtPath`로 일단 존재하는지 봐야겠네요!

- ### copyItemAtPath: toURL:error:

  해당 경로에 있는 파일을 복사합니다.  일단 이것도 경로에 있는지 체크체크!

- ### moveItemAtPath:toPath:error

   해당 경로에 있는 파일 또는 경로를   `toPath`로  이동 시킵니다. 경로체크! 



  해당 메서드에서 path를 URL로 이름을 변경하면 URL기반으로도 가능합니다!
