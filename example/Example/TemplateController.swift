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
        var formats: [TKTemplateFormat] = []
        for _ in 0..<copies {
            var format: TKTemplateFormat?
            if template.name == "sf_001" {
                // 使用假数据打印顺丰运单，模拟真实环境，详细占位符说明见 ${TKTemplate.previewUrl}
                format = makeSF001()
            } else if template.name == "UA_Welcome" { // UA欢迎页
                format = makeUAWelcome()
            } else if template.name == "UA_Packing_List" { // UA装箱单
                format = makeUAPackingList()
            } else if template.name == "UA_SF" { // UA顺丰单
                format = makeUASF()
            }
            
            if let f = format {
                formats.append(f)
            }
        }
        
        if formats.isEmpty {
            return
        }
        
        do {
            try Trimkeeper.shared.print(templates: formats)
        } catch let error {
            showAlert("打印失败", error.localizedDescription)
        }
    }
    
    private func makeSF001() -> TKTemplateFormat {
        let address = loadAddreas()
        let format = TKTemplateFormat(templateName: "sf_001")
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
        return format
    }

    // UA欢迎页
    private func makeUAWelcome() -> TKTemplateFormat {
        let format = TKTemplateFormat(templateName: "UA_Welcome")
        format.add(encodingVariable: "欢迎使用驻店宝！", forPlaceholder: "V1")
        return format
    }
    
    // UA装箱单
    private func makeUAPackingList() -> TKTemplateFormat {
        let format = TKTemplateFormat(templateName: "UA_Packing_List")
        format.add(encodingVariable: "张三李四王五赵六", forPlaceholder: "V1")
        format.add(variable: "12345678901234567890123456", forPlaceholder: "V2")
        format.add(variable: "13456876786", forPlaceholder: "V3")
        format.add(barCode: "UA20180101123232", forPlaceholder: "V4")
        
        format.add(variable: "12345678901234567890", forPlaceholder: "V5")
        format.add(encodingVariable: "男子Sport短裤 男子Sport短裤 男子Sport短裤", forPlaceholder: "V6")
        format.add(variable: "5000", forPlaceholder: "V7")
        
        format.add(variable: "1234567890", forPlaceholder: "V8")
        format.add(encodingVariable: "男子Sport短裤 男子Sport短裤 男子Sport短裤", forPlaceholder: "V9")
        format.add(variable: "5000", forPlaceholder: "V10")
        
        format.add(variable: "1234567890", forPlaceholder: "V11")
        format.add(encodingVariable: "男子Sport短裤 男子Sport短裤 男子Sport短裤", forPlaceholder: "V12")
        format.add(variable: "5000", forPlaceholder: "V13")
        
        format.add(variable: "1234567890", forPlaceholder: "V14")
        format.add(encodingVariable: "男子Sport短裤 男子Sport短裤 男子Sport短裤", forPlaceholder: "V15")
        format.add(variable: "5000", forPlaceholder: "V16")
        
        format.add(variable: "1234567890", forPlaceholder: "V17")
        format.add(encodingVariable: "男子Sport短裤 男子Sport短裤 男子Sport短裤", forPlaceholder: "V18")
        format.add(variable: "5000", forPlaceholder: "V19")
        
        format.add(variable: "10000", forPlaceholder: "V20")
        format.add(qr: "https://www.underarmour.com/en-us/", forPlaceholder: "V21")
        format.add(encodingVariable: "Under Armour官方旗舰店 - 京东", forPlaceholder: "V22")
        return format
    }
    
    // UA顺丰单
    private func makeUASF() -> TKTemplateFormat {
        let format = TKTemplateFormat(templateName: "UA_SF")
        format.add(barCode: "1234567890", forPlaceholder: "V1")
        format.add(variable: "1234567890", forPlaceholder: "V2")
        format.add(encodingVariable: "顺丰次日", forPlaceholder: "V3")
        format.add(variable: "021", forPlaceholder: "V4")
        format.add(encodingVariable: "上海市黄浦区西藏南路123号-2楼", forPlaceholder: "V5")
        format.add(encodingVariable: "商悦青年会大酒店 33059999", forPlaceholder: "V6")
        format.add(encodingVariable: "上海市黄浦区武胜路330号", forPlaceholder: "V7")
        format.add(encodingVariable: "黄浦区人民广场地区市容环境协管队", forPlaceholder: "V8")
        format.add(variable: "1000000", forPlaceholder: "V9")
        format.add(variable: "12", forPlaceholder: "V10")
        format.add(variable: "12", forPlaceholder: "V11")
        format.add(barCode: "1234567890", forPlaceholder: "V12")
        format.add(variable: "1234567890", forPlaceholder: "V13")
        format.add(encodingVariable: "上海市黄浦区武胜路330号", forPlaceholder: "V14")
        format.add(encodingVariable: "黄浦区人民广场地区市容环境协管队", forPlaceholder: "V15")
        format.add(encodingVariable: "上海市黄浦区西藏南路123号-2楼", forPlaceholder: "V16")
        format.add(encodingVariable: "商悦青年会大酒店 33059999", forPlaceholder: "V17")
        format.add(barCode: "1234567890", forPlaceholder: "V18")
        format.add(variable: "1234567890", forPlaceholder: "V19")
        return format
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

