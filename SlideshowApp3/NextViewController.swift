//
//  NextViewController.swift
//  SlideshowApp3
//
//  Created by 藤田貴久子 on 2017/09/18.
//  Copyright © 2017年 kiki.fuji. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var bigImage: UIImageView!
    // 画像の名前を受け取る
    var x:String = "a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1画面目のViewControllerから遷移する時にprepareForSegueでxに名前が入っている

        let result = UIImage(named: x)
        bigImage.image = result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
