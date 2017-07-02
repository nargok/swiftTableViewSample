//
//  ViewController.swift
//  tableViewSample
//
//  Created by 後閑諒一 on 2017/07/02.
//  Copyright © 2017年 後閑諒一. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // ステータスバーの高さ
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UITableViewを作成
        let tableView = UITableView()
        
        // サイズと位置調整
        tableView.frame = CGRect(
            x: 0,
            y: statusBarHeight,
            width: self.view.frame.width,
            height: self.view.frame.height - statusBarHeight // ステータスバーの高さに被らないように高さを引く
        )
        
        // Delegate設定
        tableView.delegate = self
        
        // DataSouurce設定
        tableView.dataSource = self
        
        // 画面にUITableViewを追加
        self.view.addSubview(tableView)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルをつくる
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.accessoryType = .detailButton
        cell.textLabel?.text = "セル\(indexPath.row + 1)"
        cell.detailTextLabel?.text = "セル\(indexPath.row + 1)番目のセルの説明"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされたときの処理
        print("タップされたセルのindex番号: \(indexPath.row)")
    }
    
    // indexPathを使えば、セルによって高さを変えることも可能
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // アクセサリボタン（セルの右にあるボタン）がタップされたときの処理
        print("タップされたアクセサリがあるセルのindex番号: \(indexPath.row)")
    }

}

