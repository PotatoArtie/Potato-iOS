//
//  ViewController.swift
//  KeyboardHeightPotato
//
//  Created by Atlas on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pinNumberTextfield: UITextField!
    @IBOutlet weak var nextBtnBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "created by using storyboard"
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        self.pinNumberTextfield.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.regiterNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unRegisterNotification()
    }
    
}

extension ViewController {
    func regiterNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardEvent), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardEvent), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unRegisterNotification(){
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardEvent(notiInfo: Notification){
        guard let userInfo = notiInfo.userInfo else { return }
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notiInfo.name == UIResponder.keyboardWillShowNotification {
            self.nextBtnBottomConstraint.constant = keyboardFrame.height - self.view.safeAreaInsets.bottom
        }else{
            self.nextBtnBottomConstraint.constant = 0
        }
    }
    
    
}
