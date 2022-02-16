import UIKit

//app버전 가져오기
var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
var minimumVersion = "1.0.0" //앱의 사용 최소 지원 버전을 1.0.0으로 가정


//like using Elvis Operator X)
//간단하게 이렇게 확인할 수도 있겠지만
let versionCompare = appVersion < minimumVersion ? "need to update" : "don't need to"
print(versionCompare)

//대게 이렇게 사용하지 싶음
if appVersion < minimumVersion {
    // 업데이트 관련 로직
}else{
    // etc
}


appVersion = "9" // 앱의 버전
minimumVersion = "8" //최소버전

// 이 구문을 실행하게 되면 어떤결과가 나올 것 같은지 생각해보자
print(appVersion < minimumVersion)


appVersion = "9" // 앱의 버전
minimumVersion = "8" //최소버전
//아스키값을 확인해 보자
print(UnicodeScalar(appVersion)?.value) // 57
print(UnicodeScalar(minimumVersion)?.value) // 56


appVersion = "10" // 앱의 버전
minimumVersion = "9" //최소버전

//이번에도 똑같을까 ?
print(appVersion < minimumVersion)


appVersion = "10"
minimumVersion = "9"

//아스키값을 확인해 보자
print(UnicodeScalar(appVersion)?.value) // nil
print(UnicodeScalar(minimumVersion)?.value) // 57


appVersion = "1.0.9"
minimumVersion = "1.0.10"


// Tada~ Look who is here!!
if appVersion.compare(minimumVersion,options: .numeric) == .orderedAscending {
    print ("need to update")
}else{
    print("don't need to")
}
