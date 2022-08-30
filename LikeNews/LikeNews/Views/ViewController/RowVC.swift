//
//  RowVC.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit

class RowVC: UIViewController {


    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var image: UIImageView!
    var descrip = ""
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descr.text =  descrip
        image.image = UIImage(named: img)
        
        // Do any additional setup after loading the view.
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
