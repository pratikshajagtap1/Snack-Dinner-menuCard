//
//  SecondViewController.swift
//  snackdinnerTableView
//
//  Created by Mac on 03/11/1944 Saka.
//

import UIKit

class SecondViewController: UIViewController {
    var detail : String = ""
    var image : UIImage?
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.detailLabel.text = detail
        self.imageView.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
