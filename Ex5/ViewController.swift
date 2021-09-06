//
//  ViewController.swift
//  Ex5
//
//  Created by 安井基哲 on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {

    // テキストフィールド２つ
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!

    // 結果ラベル
    @IBOutlet private weak var resultLabel: UILabel!

    // 計算実行ボタン
    @IBAction func calcButton(_ sender: Any) {
        // 入力不備でmessageをshowAlertに送る
        guard let value1 = Double(number1TextField.text!) else { // 被除数未入力
            showAlert(message: "割られる数を入力して下さい")
            return
        }
        guard let value2 = Double(number2TextField.text!) else { // 除数未入力
            showAlert(message: "割る数を入力して下さい")
            return
        }
        guard value2 != 0 else { // 除数0
            showAlert(message: "割る数には0を入力しないで下さい")
            return
        }

        let result = String(value1 / value2)
        resultLabel.text = result
    }

    // エラーメッセージを受け取ってアラート表示
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "課題５", message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }

    // テキストフィールド外タッチでキーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
