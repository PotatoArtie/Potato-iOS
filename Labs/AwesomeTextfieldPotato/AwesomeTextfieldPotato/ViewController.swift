//
//  ViewController.swift
//  AwesomeTextfieldPotato
//
//  Created by Atlas on 2022/02/09.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var underLineView: UIProgressView!
    
    let myView = CustomMyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myTextField.delegate = self
        self.underLineView.setProgress(0.0, animated: true)
        //배경색상 - 채워지지 않은 부분의 색상
        self.underLineView.trackTintColor = .green
        //진행색상 - 채워지는 부분의 색상
        self.underLineView.progressTintColor = .systemPink
        
        
        //Using Snapkit
        self.view.addSubview(self.myView)
        self.myView.drawCustomUI()
        
    }

    @IBAction func backgroundTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.20) {
            self.underLineView.setProgress(1.0, animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.20) {
            self.underLineView.setProgress(0.0, animated: true)
        }
    }
    
}

class CustomMyView: UIView {
    var customTextField = CustomCombineTextField().then {
        $0.myTextField.placeholder = "type user name :)"
    }
    
    var customLbl = UILabel().then {
        $0.text = "안녕하세요. 당신의 이름은 무엇인가요?"
    }
    
    var myLbl = UILabel().then {
        $0.text = "SnapKit으로 만든 화면"
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCustomUI(){
        self.addSubview(self.customTextField)
        self.addSubview(self.customLbl)
        self.addSubview(self.myLbl)
        self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        self.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.left.right.bottom.equalToSuperview().inset(20)
        }
        
        self.myLbl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(20)
        }
    
        self.customTextField.snp.makeConstraints {
            $0.top.equalTo(myLbl.snp.bottom).offset(50)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        self.customLbl.snp.makeConstraints {
            $0.top.equalTo(self.customTextField.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
    }
}


class CustomCombineTextField: UIView {
    var myTextField = UITextField().then {
        $0.textColor = .black
    }
    
    var myUnderlLine = UIProgressView(progressViewStyle: .bar).then {
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .systemCyan
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.myTextField.delegate = self
        self.drawCustomUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCustomUI(){
        self.backgroundColor = .clear
        self.addSubview(myTextField)
        self.addSubview(myUnderlLine)
        
        
        myTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(10)
        
        }
        myUnderlLine.snp.makeConstraints {
            $0.height.equalTo(10)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(myTextField.snp.bottom).offset(5)
        }
        myUnderlLine.transform = myTextField.transform.scaledBy(x: 1, y: 0.3)
        
    }
    
    
}

extension CustomCombineTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.15) {
            self.myUnderlLine.setProgress(1.0, animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.15) {
            self.myUnderlLine.setProgress(0.0, animated: true)
        }
    }
    
}
