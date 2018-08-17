//
//  TemplatesController.swift
//  Example
//
//  Created by 陆广庆 on 2018/8/16.
//  Copyright © 2018年 NextCont. All rights reserved.
//

import UIKit
import Trimkeeper

/// 模板列表
class TemplatesController: UITableViewController {

    /// 当前用户的所有打印模板。
    /// 当发现列表为空时，请调用updateAsset()更新模板
    let templates: [TKTemplate] = Trimkeeper.shared.listAllTemplates()
    
    var templateToPrint: TKTemplate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, identifier == "PrintTemplate" else {
            return
        }
        guard let templateController = segue.destination as? TemplateController else {
            return
        }
        guard let t = templateToPrint else {
            return
        }
        templateController.template = t
    }
}

extension TemplatesController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let template = templates[indexPath.row]
        // 显示名称
        // 无实际意义
        // template.displayName
        
        // 模版名称
        // 打印时需传入此参数通知sdk应用此模板
        // template.name
        
        // 模板html预览地址
        // 网页中包含模板预览，及变量的约束、限制、格式等，无实际意义，仅方便用户参考对接时使用
        // template.previewUrl
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplatesCell", for: indexPath)
        cell.textLabel?.text = template.displayName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.templateToPrint = templates[indexPath.row]
        performSegue(withIdentifier: "PrintTemplate", sender: self)
    }
    
}
