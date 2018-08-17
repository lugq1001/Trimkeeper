//
//  SDKMainController.swift
//  Example
//
//  Created by 陆广庆 on 2018/8/16.
//  Copyright © 2018年 NextCont. All rights reserved.
//

import UIKit
import Trimkeeper

class SDKMainController: UIViewController {

    @IBOutlet weak var iPrinterButton: UIButton!
    @IBOutlet weak var iUpdateAssetButton: UIButton!
    @IBOutlet weak var iSendAssetButton: UIButton!
    @IBOutlet weak var iPrintButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 注册Trimkeeper回调, 回调方法会在主线程中执行
        Trimkeeper.shared.delegate = self
    }

    /// 连接打印机，支持ip或者域名，默认端口为9100
    /// 打印、发送资源文件需要先连接打印机。
    /// sdk目前不控制打印机自动重连，需要App监听状态，手动维持连接。
    /// 建议在sdk注册成功后连接打印机，并保持连接
    @IBAction func connectToPrinter(_ sender: Any) {
        let host = UserDefaults.standard.string(forKey: "PrintHost")
        showAlertWithEdit("输入打印机域名或ip", autoComplete: host) { [weak self] host in
            UserDefaults.standard.setValue(host, forKey: "PrintHost")
            do {
                self?.iPrinterButton.isEnabled = false
                
                let printer = Printer(host: host, mode: .avery9419)
                try Trimkeeper.shared.connectPrinter(printer)
                
            } catch let error {
                self?.iPrinterButton.isEnabled = true
                self?.showAlert("打印机连接失败", error.toTrimkeeperError.description)
            }
        }
    }
    
    /// 从网络下载打印机基础资源，如模板、图片等。
    /// sdk会自动保存资源文件至磁盘。
    /// 建议App每次启动后调用此方法。
    @IBAction func updateAsset(_ sender: Any) {
        self.iUpdateAssetButton.isEnabled = false
        Trimkeeper.shared.updateAssets { [weak self] (trimkeeperError) in
            if let error = trimkeeperError {
                self?.iUpdateAssetButton.isEnabled = true
                self?.showAlert("下载资源失败", error.description)
            } else {
                self?.iUpdateAssetButton.isEnabled = false
                self?.iUpdateAssetButton.setTitle("资源更新成功", for: .normal)
            }
        }
    }
    
    /// 将资源文件发送至打印机并更新。
    /// 下载更新资源后、或人为因素造成资源文件丢失时，需要调用此方法将资源上传资源至打印机。
    /// 建议仅在调用完updateAssets()后调用一次，频繁调用无任何意义且会影响打印效率
    @IBAction func sendAsset(_ sender: Any) {
        self.iSendAssetButton.isEnabled = false
        Trimkeeper.shared.sendAssetsToPrinter{ [weak self] (trimkeeperError) in
            if let error = trimkeeperError {
                self?.iSendAssetButton.isEnabled = true
                self?.showAlert("发送打印机资源失败", error.description)
            } else {
                self?.iSendAssetButton.isEnabled = false
                self?.iSendAssetButton.setTitle("资源已发送至打印机", for: .normal)
            }
        }
    }
    
    /// 打印
    @IBAction func printTemplate(_ sender: Any) {
        performSegue(withIdentifier: "Templates", sender: nil)
    }
    
}

extension SDKMainController: TrimkeeperDelegate {
    
    /// 打印机连接成功后会进入此方法
    func trimkeeper(didConnectTo printer: Printer) {
        print("打印机 \(printer) 连接成功")
        self.iPrinterButton.isEnabled = false
        self.iPrinterButton.setTitle("\(printer.host):\(printer.port)", for: .normal)
        
    }
    
    /// 打印机断开连接后会进入此方法
    func trimkeeper(didDisconnectTo printer: Printer, withError error: TrimkeeperError) {
        print("打印机 \(printer) 连接失败 \(error.description)")
        self.iPrinterButton.isEnabled = true
        self.iPrinterButton.setTitle("连接打印机", for: .normal)
    }
    
}


