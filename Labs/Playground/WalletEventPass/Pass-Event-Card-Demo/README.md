# Pass-Event-Card
> 간단한 이벤트 패스를 만들어 볼 수 있습니다. 

#서명 인증서 생성
모든 기기에서 패스가 작동하기 전에(심지어 iOS 시뮬레이터에서도) 애플에서 발급한 인증서로 서명해야 합니다.

1. [Apple Developer Account](https://developer.apple.com/account/) 로 이동합니다.
2. '인증서, 식별자 및 프로필'로 이동하여 '패스 유형 ID'를 클릭합니다.
3. 적절한 식별자 문자열을 지정하여 새 Pass Type ID를 만듭니다.
4. Certificates로 이동하여 '+'를 클릭하고 'Pass Type ID Certificate'를 선택합니다.
5. 이전에 작성한 Pass Type ID를 선택하고 단계에 따라 인증서를 생성하여 Mac의 보안 키체인으로 가져옵니다.

# 사용자의 패스 구성
패스에 대한 모든 정보 및 구성 설정은 'pass.json' 파일에 있습니다.
패스 템플릿을 Apple에서 생성한 서명 인증서와 정렬하려면 'pass.json'을 열고 다음을 수행합니다:

* 'passTypeIdentifier'의 경우 'PassTypeIDs' 패널에 선택한 식별자 문자열을 붙여넣습니다.
* 'teamIdentifier'의 경우 Apple Developer 계정의 [Membership panel](https://developer.apple.com/account/ #/membership/)로 이동하여 'teamID' 행의 코드를 복사합니다.

# 출입증 만들기
'pass.json'을 Pass Type ID와 Team ID로 구성하고 인증서를 키체인에 설치한 후에는 'signpass' 유틸리티를 사용하여 Pass를 생성할 수 있습니다.

터미널을 열고 이 프로젝트 폴더로 이동한 다음 실행
```
./signpass -p ExampleCard
```

모든 것이 잘 진행되면 동일한 폴더에 'ExampleCard.pkpass' 파일이 생성됩니다.

# 패스 테스트
패스가 생성되면 iOS 시뮬레이터에서 테스트할 수 있습니다. 아이폰 기기의 시뮬레이터를 열고 '.pkpass' 파일을 시뮬레이터 창으로 끌어오기만 하면 됩니다.
패스가 올바르게 설정되어 있으면 자동으로 시뮬레이터에 표시됩니다.
실패하면 아무 일도 일어나지 않습니다.

# 패스 디버깅
.pkpass 파일을 iOS 시뮬레이터로 끌어도 아무 일도 하지 않으면 Mac에서 콘솔 앱을 열어 iOS 시뮬레이터의 장치 로그를 볼 수 있습니다. 
.pkpass 파일을 가져와 볼 때마다 실패 이유가 적힌 오류 메시지가 로그에 나타납니다.

# 자세한 정보
* Apple의 패스 생성에 대한 문서는 Apple Developer 웹 사이트에서 [Introducting Wallet](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/PassKit_PG/index.html #//apple_ref/doc/uid/TP40012195-CH1-SW1) 페이지를 확인하십시오.
* pass.json에서 허용되는 키의 종류에 대한 자세한 내용은 Apple Developer 웹 사이트에서 [Top-Level Keys](https://developer.apple.com/library/content/documentation/UserExperience/Reference/PassKit_Bundle/Chapters/TopLevel.html) 페이지를 확인하십시오.
* 샘플 패스와 'signpass'의 소스 코드는 [본 샘플 코드 다운로드](https://developer.apple.com/services-account/download?path=/iOS/Wallet_Support_Materials/WalletCompanionFiles.zip)를 확인하십시오.
