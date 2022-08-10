//
//  ViewController.swift
//  MVVMPotato
//
//  Created by Atlas on 2022/03/01.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    var potatoView = PotatoView()
    var potatoViewModel: PotatoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setup()
        
    }
}

extension ViewController{
    func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(potatoView)
        potatoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setup(){
        self.potatoViewModel = PotatoViewModel(potato: Potato.getData())
        self.potatoView.delegate = self
    }
}

extension ViewController: CustomDelegate {
    func buttonPressed() {
        guard let vm = potatoViewModel else { return }
        self.potatoView.updatePotatoText(info: vm.getProductInfo()) 
    }
}
