//
//  ViewController.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 8/30/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileTest = "Test"
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileTest).appendingPathExtension("txt")
        
        print("File Path \(fileURL.path)")
        
        let write = "write text to file"
        do {
            try write.write(to:fileURL, atomically: true,encoding:String.Encoding.utf8)
        }
        catch let error as NSError{
            print("Write Failed")
            print(error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddVitalCell") as! AddVitalCell
        cell.saveBtn.tag = indexPath.row
        cell.saveBtn.addTarget(self, action: #selector(targetFuncForSavebutton(_ :)), for: .touchUpInside)
        return cell
    }
    
    func targetFuncForSavebutton(_ sender : UIButton){
        
        var value : String?
        let index = sender.tag
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = self.viewController.vitalsTableView.cellForRow(at: indexPath) as? AddVitalCell else{
            return
        }
        
        if let text = cell.testTxt.text, !text.isEmpty {
            value = text
            print("Geting Value \(value)")
        }
        
    }
    

}

