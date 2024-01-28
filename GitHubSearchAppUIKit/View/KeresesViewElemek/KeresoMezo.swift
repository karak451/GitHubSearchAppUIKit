//
//  KeresoMezo.swift
//  GitHubSearchAppUIKit
//
//  Created by Sudar Istvan on 2024. 01. 29..
//

import UIKit

class KeresoMezo: UIView {
    
    private lazy var keresoMezoView: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        
        
        return vw
    }()
    
    private lazy var headerText: UILabel = {
        var lbl = UILabel()
        lbl.text = "Keresés a GitHubon"
        lbl.font = .systemFont(ofSize: 32, weight: .bold)
        lbl.textColor = UIColor.white
       return lbl
    }()
    
    private lazy var mezoEsGombStack: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
    //    vw.spacing = 8
        
        return vw
    }()
    
    private lazy var keresoMezoBackground: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.layer.cornerRadius = 5
        vw.backgroundColor = UIColor(named: "vilagosSzurke")
        
        return vw
    }()
    
    private lazy var keresoMezoBorder: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.layer.cornerRadius = 5
        vw.backgroundColor = UIColor(named: "sotetSzurke")
        
        return vw
    }()
    
    private lazy var keresoMezo: UITextField = {
       var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = ""
        textField.textColor = UIColor(named: "sotetSzurke")
        textField.tintColor = UIColor(named: "sotetSzurke")
        textField.backgroundColor = UIColor(named: "vilagosSzurke")
        textField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    private lazy var hintText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Repository keresése "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "sotetSzurke")
        label.backgroundColor = UIColor(named: "vilagosSzurke")
        
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Keress!".uppercased()
        config.baseBackgroundColor = UIColor.gray
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        return btn
    }()
    
    private lazy var reszletezoButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "Részletes keresés"
        config.baseBackgroundColor = UIColor.black
        config.baseForegroundColor = UIColor(named: "vilagosSzurke")
        config.buttonSize = .small
        
        let btn2 = UIButton(configuration: config)
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn2.contentHorizontalAlignment = .leading
        btn2.isHidden = false
        btn2.addTarget(self, action: #selector(didTapReszletes(_:)), for: .touchUpInside)
        return btn2
    }()
    
    
    private lazy var nyelvStack: UIStackView = {
       let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.spacing = 8
        vw.isHidden = true
        
        return vw
    }()
    
    private lazy var nyelvText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "nyelv: "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "vilagosSzurke")
        
        return label
    }()
    
    private lazy var nyelvMezo: UITextField = {
       var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "programozási nyelv"
        textField.textColor = UIColor(named: "sotetSzurke")
        textField.tintColor = UIColor(named: "sotetSzurke")
        textField.backgroundColor = UIColor(named: "vilagosSzurke")
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    private lazy var elrejtButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "elrejt"
        config.baseBackgroundColor = UIColor.black
        config.baseForegroundColor = UIColor(named: "vilagosSzurke")
        config.buttonSize = .medium
        
        let btn3 = UIButton(configuration: config)
        btn3.translatesAutoresizingMaskIntoConstraints = false
        btn3.contentHorizontalAlignment = .leading
        btn3.addTarget(self, action: #selector(didTapElrejt(_:)), for: .touchUpInside)
        return btn3
    }()
    
    private var nestedAction: (String, String?) -> ()
    init(nestedAction: @escaping (String, String?) -> ()) {
        self.nestedAction = nestedAction
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension KeresoMezo{
    func setup(){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(keresoMezoView)
        keresoMezoView.addArrangedSubview(headerText)
        keresoMezoView.addArrangedSubview(mezoEsGombStack)
    //    keresoMezoView.addArrangedSubview(reszletezoButton)
      //  keresoMezoView.addArrangedSubview(nyelvStack)
        
        mezoEsGombStack.addSubview(keresoMezoBackground)
        mezoEsGombStack.addSubview(searchButton)
        
        keresoMezoBackground.addSubview(keresoMezoBorder)
            keresoMezoBorder.addSubview(keresoMezo)
                keresoMezo.addSubview(hintText)
        
//        nyelvStack.addArrangedSubview(nyelvText)
  //      nyelvStack.addArrangedSubview(nyelvMezo)
    //    nyelvStack.addArrangedSubview(elrejtButton)
        
        NSLayoutConstraint.activate([
            
            keresoMezoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            keresoMezoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            keresoMezoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            keresoMezoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            headerText.leadingAnchor.constraint(equalTo: keresoMezoView.leadingAnchor),
            headerText.topAnchor.constraint(equalTo: keresoMezoView.topAnchor),
            headerText.trailingAnchor.constraint(equalTo: keresoMezoView.trailingAnchor),
      //      headerText.bottomAnchor.constraint(equalTo: mezoEsGombStack.topAnchor, constant: -15),
            
            mezoEsGombStack.topAnchor.constraint(equalTo: headerText.bottomAnchor),
            mezoEsGombStack.leadingAnchor.constraint(equalTo: keresoMezoView.leadingAnchor),
            mezoEsGombStack.trailingAnchor.constraint(equalTo: keresoMezoView.trailingAnchor),
   //         mezoEsGombStack.leadingAnchor.constraint(equalTo: keresoMezoView.leadingAnchor),
     //       mezoEsGombStack.trailingAnchor.constraint(equalTo: keresoMezoView.trailingAnchor),
            
            keresoMezoBackground.leadingAnchor.constraint(equalTo: mezoEsGombStack.leadingAnchor),
            keresoMezoBackground.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor),
            keresoMezoBackground.topAnchor.constraint(equalTo: mezoEsGombStack.topAnchor),
            keresoMezoBackground.bottomAnchor.constraint(equalTo: mezoEsGombStack.bottomAnchor),
            
         //   searchButton.leadingAnchor.constraint(equalTo: keresoMezoBorder.trailingAnchor),
          //  searchButton.trailingAnchor.constraint(equalTo: mezoEsGombStack.trailingAnchor),
            searchButton.topAnchor.constraint(equalTo: mezoEsGombStack.topAnchor),
            searchButton.bottomAnchor.constraint(equalTo: mezoEsGombStack.bottomAnchor),
            
            keresoMezoBorder.leadingAnchor.constraint(equalTo: keresoMezoBackground.leadingAnchor, constant: 4),
            keresoMezoBorder.trailingAnchor.constraint(equalTo: keresoMezoBackground.trailingAnchor, constant: -4),
            keresoMezoBorder.topAnchor.constraint(equalTo: keresoMezoBackground.topAnchor, constant: 4),
            keresoMezoBorder.bottomAnchor.constraint(equalTo: keresoMezoBackground.bottomAnchor, constant: -4),
           
            keresoMezo.leadingAnchor.constraint(equalTo: keresoMezoBorder.leadingAnchor, constant: 1),
            keresoMezo.topAnchor.constraint(equalTo: keresoMezoBorder.topAnchor, constant: 1),
            keresoMezo.trailingAnchor.constraint(equalTo: keresoMezoBorder.trailingAnchor, constant: -1),
            keresoMezo.bottomAnchor.constraint(equalTo: keresoMezoBorder.bottomAnchor, constant: -1),
            
            hintText.leadingAnchor.constraint(equalTo: keresoMezo.leadingAnchor, constant: 10),
            hintText.topAnchor.constraint(equalTo: keresoMezo.topAnchor, constant: -5),
            
    //        reszletezoButton.leadingAnchor.constraint(equalTo: keresoMezoView.leadingAnchor),
      //      reszletezoButton.topAnchor.constraint(equalTo: mezoEsGombStack.bottomAnchor),
        //    reszletezoButton.trailingAnchor.constraint(equalTo: keresoMezoView.trailingAnchor),
            
//            nyelvStack.leadingAnchor.constraint(equalTo: keresoMezoView.leadingAnchor),
  //          nyelvStack.topAnchor.constraint(equalTo: mezoEsGombStack.bottomAnchor, constant: 15),
    //        nyelvStack.trailingAnchor.constraint(equalTo: keresoMezoView.trailingAnchor),
            
//            nyelvText.leadingAnchor.constraint(equalTo: nyelvStack.leadingAnchor),
  //          nyelvText.topAnchor.constraint(equalTo: nyelvStack.topAnchor),
    //        nyelvText.trailingAnchor.constraint(equalTo: nyelvMezo.leadingAnchor),
      //      nyelvText.bottomAnchor.constraint(equalTo: nyelvStack.bottomAnchor),
            
//            nyelvMezo.leadingAnchor.constraint(equalTo: nyelvText.trailingAnchor),
  //          nyelvMezo.topAnchor.constraint(equalTo: nyelvStack.topAnchor),
    //        nyelvMezo.trailingAnchor.constraint(equalTo: elrejtButton.leadingAnchor),
      //      nyelvMezo.bottomAnchor.constraint(equalTo: nyelvStack.bottomAnchor),
            
//            elrejtButton.leadingAnchor.constraint(equalTo: keresoMezoBackground.trailingAnchor),
  //          elrejtButton.topAnchor.constraint(equalTo: nyelvStack.topAnchor),
    //        elrejtButton.trailingAnchor.constraint(equalTo: nyelvStack.trailingAnchor),
      //      elrejtButton.bottomAnchor.constraint(equalTo: nyelvStack.bottomAnchor),
        ])
    }
    
    @objc func didTapSearch(sender: UIButton) {
        print("button megnyomva")
        if(keresoMezo.text != nil){
            if(nyelvMezo.text != nil){
                nestedAction(keresoMezo.text!, nyelvMezo.text)
            } else {
                nestedAction(keresoMezo.text!, nil)
            }
        }
    }
    
    @objc func didTapReszletes(_ sender: UIButton){
        reszletezoButton.isHidden = true
        nyelvStack.isHidden = false
    }
    
    @objc func didTapElrejt(_ sender: UIButton){
        reszletezoButton.isHidden = false
        nyelvStack.isHidden = true
        
    
    }
}
