//
//  ViewController2.swift
//  arigatoApp
//
//  Created by 深瀬貴将 on 2019/08/22.
//  Copyright © 2019 fukase. All rights reserved.
//

import UIKit
import Foundation

class ViewController2: UIViewController {
    
    let lisu0 = UIImage(named: "lisu0")
    let lisu1 = UIImage(named: "lisu1")
    let lisu2 = UIImage(named: "lisu2")
    let lisu3 = UIImage(named: "lisu3")
    let lisu4 = UIImage(named: "lisu4")
    let lisu5 = UIImage(named: "lisu5")
    let lisu6 = UIImage(named: "lisu6")
    let lisu7 = UIImage(named: "lisu7")

    
    
    
    @IBOutlet weak var label1: UILabel!
    
    //リス君登場で一旦削除されたタイマーを、ありがとうボタン押して再開させる
    @IBAction func arigatoButton(_ sender: Any) {
        
        //（ボタンを押してタイマー再開してから次の画像と字幕が表示されるまでの1秒のラグ（タイマーで設定してる）を無くす為にこの２処理だけ別で先に入力しておく
        imageView1.image = lisu4
        label1.text = "ニコッ"
        
        //1秒ごとにonTimer()を実行
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        arigatoButton.isHidden = true
        
    }
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var arigatoButton: UIButton!
    
    var timer = Timer()
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "lisu0",
            "lisu1",
            "lisu2",
            "lisu3",
            "lisu5",
            "lisu6",
            "lisu7"
        ]
        
        // エラー防止で要素の番号を範囲内に制御
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 6
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 6 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView1.image = image
    }
    
    
    
    //表示している字幕の番号
    var subtitleNo = 0
    
    //字幕を表示する関数
    func printSubtitle() {
        
        
        //リス君が来た時に言うセリフパターン一覧
        let eventArr = [
            "どんぐりを拾ったよ！\nあげるね！",
            "やっほー！\nコーヒー豆1粒あげる！",
            "塩キャンディーあげる！\n熱中症きをつけてね！",
            "はい！三つ葉のクローバー！\n三つ葉でも可愛いよね！",
            "バナナ半分あげる！\n誰かと一緒に食べると２倍美味しいんだよ！"
        ]
        
        
        //↑のリス君のセリフをランダムで取り出してsubtitleNo == 3の時に表示させる
        var r = 0
        
        r = Int(arc4random_uniform(UInt32(eventArr.count)))
        
        let subtitleArr = [
            "…",
            "タタタ…",
            "タタタ…タタタタ…",
            "\(eventArr[r])",
            "タタタ…",
            "タタタ…タタタタ…",
            "タタタ…タタタタ…"
        ]
        
        //エラー防止で要素の番号を範囲内に制御
        if subtitleNo < 0 || subtitleNo > 6 {
            subtitleNo = 0
        }
        
        // subtitleNoに合った字幕をはめ込む
        let subtitle = subtitleArr[subtitleNo]
        
        // はめこんだ字幕を表示
        label1.text = subtitle
    }
    
    
    // Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer() {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        subtitleNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        printSubtitle()
        
        //lisu3（何かをしてくれる場面）で一旦タイマーを削除。(arigatoButtonが押されたら再開される)
        if dispImageNo == 3 {
            timer.invalidate()
            arigatoButton.isHidden = false
        
        //lisu7（最後の画像）で再びタイマーを終了させる
        }else if dispImageNo == 6 {
            timer.invalidate()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lisu0 = UIImage(named: "lisu0")
        imageView1.image = lisu0
        label1.text = "…"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        
    }
    
    
}
