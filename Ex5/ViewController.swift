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
    @IBOutlet weak var resultLabel: UILabel!

    // 計算実行ボタン
    @IBAction func calcButton(_ sender: Any) {
        // 各String?をDouble?に変換しDoubleに変換。未入力や文字列が入力された際は0に変換
        let value1 = Double(number1TextField.text ?? "") ?? 0
        let value2 = Double(number2TextField.text ?? "") ?? 0

        // 入力不備でmessageをshowAlertに送る
        if number1TextField.text == "" { // 被除数空白
            showAlert(message: "被除数を入力してください")
        } else if number2TextField.text == "" { // 序数空白
            showAlert(message: "除数を入力してください")
        } else if value2 == 0 { // 序数0
            showAlert(message: "除数は0以外の数字を入力してください")
        } else { // 計算と表示の実行
            let result = String(value1 / value2)
            resultLabel.text = result
        }
    }

    func showAlert(message: String) {
        // アラートの設定。message以外は同じ。
        let title = "課題５"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }

    // テキストフィールド外タッチでキーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
