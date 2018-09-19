//
//  RegisterController.swift
//  Example
//
//  Created by 陆广庆 on 2018/8/16.
//  Copyright © 2018年 NextCont. All rights reserved.
//

import UIKit
import Trimkeeper

/// SDK注册界面
class RegisterController: UIViewController {

    @IBOutlet weak var iAppIDEdit: UITextField!
    @IBOutlet weak var iAppSecretEdit: UITextField!
    @IBOutlet weak var iRegisterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadForm()
    }

    @IBAction func register(_ sender: Any) {
        guard let appId = iAppIDEdit.text, let appSecret = iAppSecretEdit.text, !appId.isEmpty, !appSecret.isEmpty else {
            return
        }
        iRegisterButton.isEnabled = false
        /// 注册sdk
        Trimkeeper.shared.register(appID: appId, appSecret: appSecret) { [weak self] (trimkeeperError) in
            guard let wself = self else {
                return
            }
            wself.saveForm()
            wself.iRegisterButton.isEnabled = true
            if let error = trimkeeperError {
                // 注册失败
                wself.showAlert("Register Failed", error.message)
                return
            }
            wself.performSegue(withIdentifier: "SDKMain", sender: self)
        }
    }
    
    
    /// 读取保存的AppId，AppSecret
    func loadForm() {
        let defaults = UserDefaults.standard
        iAppIDEdit.text = defaults.string(forKey: "AppID")
        iAppSecretEdit.text = defaults.string(forKey: "AppSecret")
    }
    
    /// 保存的AppId，AppSecret
    func saveForm() {
        let defaults = UserDefaults.standard
        defaults.setValue(iAppIDEdit.text, forKey: "AppID")
        defaults.setValue(iAppSecretEdit.text, forKey: "AppSecret")
    }

}

