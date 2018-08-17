//
//  TemplateController.swift
//  Example
//
//  Created by 陆广庆 on 2018/8/16.
//  Copyright © 2018年 NextCont. All rights reserved.
//

import UIKit
import WebKit
import Trimkeeper

class TemplateController: UIViewController {

    var template: TKTemplate!
    
    @IBOutlet weak var iPreviewWeb: WKWebView!
    @IBOutlet weak var iPrintButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let previewURL = URL(string: template.previewUrl) {
            iPreviewWeb.load(URLRequest(url: previewURL))
        }
    }

    @IBAction func printTemplate(_ sender: Any) {
        showAlertWithEdit("打印份数", autoComplete: "1") { (text) in
            self.print(copies: Int(text) ?? 1)
        }
    }
    
}

extension TemplateController {
    
    private func print(copies: Int) {
        let address = loadAddreas()
        
        var formats: [TKTemplateFormat] = []
        
        for _ in 0..<copies {
            let format = TKTemplateFormat(templateName: template.name)
            if template.name == "sf_001" {
                // 使用假数据打印顺丰运单，模拟真实环境，详细占位符说明见 ${TKTemplate.previewUrl}
                
                // 随机地址
                let random = Int(arc4random_uniform(UInt32(address.count)))
                let addr = address[random]
                
                format.add(qr: "100100101", forPlaceholder: "V1")
                format.add(variable: "100100101", forPlaceholder: "V2")
                format.add(qr: "100100102", forPlaceholder: "V3")
                format.add(variable: "100100102", forPlaceholder: "V4")
                format.add(qr: "100100103", forPlaceholder: "V5")
                format.add(variable: "100100103", forPlaceholder: "V6")
                
                format.add(encodingVariable: "顺丰次日", forPlaceholder: "V7")
                format.add(encodingVariable: "679仓库", forPlaceholder: "V8")
                
                format.add(encodingVariable: "衣服", forPlaceholder: "V13")
                format.add(encodingVariable: "转协议客户", forPlaceholder: "V14")
                
                let send = "优衣库网购物流中心 0295 分仓"
                format.add(encodingVariable: send, forPlaceholder: "V12")
                format.add(encodingVariable: send, forPlaceholder: "V15")
                format.add(encodingVariable: send, forPlaceholder: "V19")
                
                format.add(encodingVariable: addr.area, forPlaceholder: "V9")
                format.add(encodingVariable: addr.street, forPlaceholder: "V10")
                format.add(encodingVariable: addr.name, forPlaceholder: "V11")
                
                format.add(encodingVariable: addr.area, forPlaceholder: "V16")
                format.add(encodingVariable: addr.street, forPlaceholder: "V17")
                format.add(encodingVariable: addr.name, forPlaceholder: "V18")
                
                format.add(encodingVariable: addr.area, forPlaceholder: "V20")
                format.add(encodingVariable: addr.street, forPlaceholder: "V21")
                format.add(encodingVariable: addr.name, forPlaceholder: "V22")
            }
            formats.append(format)
        }
        
        if formats.isEmpty {
            return
        }
        
        do {
            try Trimkeeper.shared.print(templates: formats)
        } catch let error {
            showAlert("打印失败", error.toTrimkeeperError.description)
        }
    }
    
    private func loadAddreas() -> [Address] {
        var address: [Address] = []
        let plistPath = Bundle.main.path(forResource: "Address", ofType:"plist")!
        if let array = NSArray(contentsOfFile: plistPath) {
            for obj in array {
                let dict = obj as! [String: String]
                let area = dict["0"]!
                let street = dict["1"]!
                let name = dict["2"]!
                let a = Address(area: area, street: street, name: name)
                address.append(a)
            }
        }
        return address
    }
    
}


/// 模拟顺丰运单SF_001模板假数据
struct Address {
    
    let area: String
    let street: String
    let name: String
    
}

