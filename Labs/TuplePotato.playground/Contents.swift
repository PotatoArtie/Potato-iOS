import UIKit
import Foundation

//: ## 리팩토링 전 바로 짜 본 코드
/**
의식의 흐름대로 머리보다 손으로 짜 본 코드
@parameter  id 아이디
@parameter  password 비밀번호
@return (success: Bool,errorMessage: String?) (성공여부, 에러메시지)
 */
func isValid0(id: String?, password: String?) -> (success: Bool,errorMessage: String?) {
    guard ((id?.isEmpty) != nil) else { return (false,"id를 입력해주세요")}
    guard ((password?.isEmpty) != nil) else { return (false,"비밀번호를 입력해주세요")}
    return (true,nil)
}

//: ## 둘 다 입력이 안된경우
let validationCheckResult = isValid0(id: nil, password: nil)
if validationCheckResult.success {
    // do your next job
}else{
    print(validationCheckResult.errorMessage)
}

//: ## ID 만 입력된 경우"
let validationCheckResult2 = isValid0(id: "atlas", password: nil)
if validationCheckResult2.success {
    // do your next job
}else{
    print(validationCheckResult2.errorMessage)
}


//: ## Refactoring

var idTextField: UITextField = UITextField()
var passwordTextField: UITextField = UITextField()

idTextField.tag = 0
passwordTextField.tag = 1

//: ### 튜플의 가독성이 불편하여 사용할 때는 간편하게보기 위해 typealias 사용
typealias MyErrorType = (success: Bool,errorMessage: String?)


//: ### enum 으로 에러메시지 정리, CaseIterable 프로토콜을 사용하여 tagId로 case 의 rawValue 가져오도록 함
enum ErrorMessage: String, CaseIterable {
    case id = "id를 입력해주세요"
    case password = "패스워드를 입력해주세요"
    case somecase = "____"
    
    static func getMessageByTagId(tag: Int) -> String {
        for (index,item) in self.allCases.enumerated() {
            if index == tag {
                return item.rawValue
            }
        }
        return ""
    }
}

//: ### 함수 리팩토링
func isValid1(textFields: UITextField ...) -> MyErrorType {
    for item in textFields {
        guard let text = item.text, text.isEmpty else {
            // textField가 nil이거나 !empty 이면 continue
            continue
        }
        // isEmpty 이면 false return
        return (false, "\(ErrorMessage.getMessageByTagId(tag: item.tag))")
        
    }
    return (true,nil)
}


let validationResult = isValid1(textFields: idTextField,passwordTextField)

print("아이디 미입력 , 패스워드 미입력------------")
print(validationResult)
print(validationResult.success)
print(validationResult.errorMessage)

idTextField.text = "Atlas"
print()
print()
print()
print("아이디 입력 , 패스워드 미입력------------")
let validationResult2 = isValid1(textFields: idTextField,passwordTextField)

print(validationResult2)
print(validationResult2.success)
print(validationResult2.errorMessage)

//TODO Result Type 써보기 
