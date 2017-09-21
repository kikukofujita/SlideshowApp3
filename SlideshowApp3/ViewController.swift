//
//  ViewController.swift
//  SlideshowApp3
//
//  Created by 藤田貴久子 on 2017/09/18.
//  Copyright © 2017年 kiki.fuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnName: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var goNext: UIButton!
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        goBack.isEnabled = true
        goNext.isEnabled = true
        btnName.setTitle("再生", for: UIControlState.normal)
    }
    
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    var timer_sec: Int = 0
    
    // 表示している画像の番号
    var dImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = [ "j0175548.jpg",
                           "j0178740.jpg",
                           "j0178459.jpg",
                           ]
    
    
/*    // 表示している画像の番号を基に画像を表示
    func dispImage() {
        
        // 画像の番号のチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dImageNo < 0 {
            dImageNo = 2
        }
        // 範囲より上を指している場合、最初の画像を表示
        if dImageNo > 2 {
            dImageNo = 0
        }
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[dImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // ImageViewに読み込んだ画像をセット
        imageView.image = image
        
    }  */
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のNextViewControllerを取得
            let nextViewController:NextViewController = segue.destination as! NextViewController
            nextViewController.x = imageNameArray[dImageNo]

            if self.timer != nil {
                self.timer.invalidate()  // 現在のタイマーを破棄
                self.timer = nil
            }
    }

    
    
    @IBAction func modoru(_ sender: Any) {
 //       if self.timer == nil {
            dImageNo -= 1   // 画像の番号を１減らす
            // 画像の番号のチェック
            // 範囲より下を指している場合、最後の画像を表示
            if dImageNo < 0 {
                dImageNo = 2
            }
            // 範囲より上を指している場合、最初の画像を表示
            if dImageNo > 2 {
                dImageNo = 0
            }
            // 表示している画像の番号から名前を取り出す
            let name = imageNameArray[dImageNo]
            // 画像を読み込み
            let image = UIImage(named: name)
            // ImageViewに読み込んだ画像をセット
            imageView.image = image
    //    }
    }
    
    @IBAction func susumu(_ sender: Any) {
  //      if self.timer == nil {
            dImageNo += 1   // 画像の番号を１減らす
            // 画像の番号のチェック
            // 範囲より下を指している場合、最後の画像を表示
            if dImageNo < 0 {
                dImageNo = 2
            }
            // 範囲より上を指している場合、最初の画像を表示
            if dImageNo > 2 {
                dImageNo = 0
            }
            // 表示している画像の番号から名前を取り出す
            let name = imageNameArray[dImageNo]
            // 画像を読み込み
            let image = UIImage(named: name)
            // ImageViewに読み込んだ画像をセット
            imageView.image = image
   //     }
    }
    
    @IBAction func saisei(_ sender: Any) {
        
        if self.timer == nil {
            btnName.setTitle("停止", for:UIControlState.normal)
 
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
            goBack.isEnabled = false
            goNext.isEnabled = false
        } else {
            btnName.setTitle("再生", for: UIControlState.normal)
            self.timer.invalidate()  // 現在のタイマーを破棄
            self.timer = nil
            goBack.isEnabled = true
            goNext.isEnabled = true
        }
    }
    
    func updateImage(timer: Timer) {
        
        // 表示している画像の番号を１増やす
        dImageNo += 1
        // 画像の番号のチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dImageNo < 0 {
            dImageNo = 2
        }
        // 範囲より上を指している場合、最初の画像を表示
        if dImageNo > 2 {
            dImageNo = 0
        }
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[dImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // ImageViewに読み込んだ画像をセット
        imageView.image = image
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let image = UIImage(named: "j0175548.jpg")
        //imageView.image = image
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[dImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // ImageViewに読み込んだ画像をセット
        imageView.image = image
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

