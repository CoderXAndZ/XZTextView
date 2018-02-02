//
//  ViewController.swift
//  XZTextView
//
//  Created by admin on 2018/1/31.
//  Copyright © 2018年 XZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var textView = XZTextView(frame: CGRect(x: 50, y: 100, width: 200, height: 40)) { (text, height) in
        
        // 修改输入框高度
        self.changeHeight(height: height)
    }

    /// 修改输入框高度
    private func changeHeight(height: CGFloat) {
        
        // 修改输入框高度
        textView.frame.size.height = height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

}

// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if ((textView as! XZTextView).hasImage != nil && (textView as! XZTextView).hasImage == true){
            if range.contains(0) { // text == "" 删除 "\n" 换行
                
                return false
            }else {
                return true
            }
        }
        
        return true
    }

}


// MARK: - 设置页面
extension ViewController {
    
    func setupUI() {
        
        textView.cornerRadius = 4
        textView.delegate = self
        textView.becomeFirstResponder()
        view.addSubview(textView)
        
        textView.numOfLines = 3
        
//        textView.hasImage = true
        
        textView.placeHolder = "我就是个占位字符"
        
        textView.placeholderFontSize = 12.0
        
        textView.placeholderColor = UIColor.red
        
        textView.fontSize = 15
        
    }
    
}

