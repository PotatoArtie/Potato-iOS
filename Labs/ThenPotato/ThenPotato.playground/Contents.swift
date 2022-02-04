//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Then
import SnapKit

class MyViewController : UIViewController {
    let nameLbl = UILabel().then { item in
        item.text = "Atlas"
        item.textAlignment = .center
        item.textColor  = .red
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)

            
        nameLbl.snp.makeConstraints { make in
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
        view.addSubview(nameLbl)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
