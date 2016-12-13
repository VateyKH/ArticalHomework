//
//  DetailViewController.swift
//  coreTest
//
//  Created by otey on 12/5/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userImgDetail: UIImageView!
    @IBOutlet weak var usernameDetail: UITextField!
    @IBOutlet weak var emailDetail: UITextField!
    
    var imagePicker: UIImagePickerController!
    var userToEdit: User?
    
    func getDirectory() -> String{
        let urls = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        
        // userDomain mask is user's home directory --- place to install user's personal items
        
        let documentsDirectory = urls[0]
        return documentsDirectory
    }

    func loadData(){
        if let user = userToEdit{
            usernameDetail.text = user.username
            emailDetail.text = user.email
            
            let imageURL = user.toImage?.imageURL
            let filemanager = FileManager.default
            let imgPath = (self.getDirectory() as NSString).appendingPathComponent(imageURL!)
            if filemanager.fileExists(atPath: imgPath){
                self.userImgDetail.image = UIImage(contentsOfFile: imgPath)
            }
            else {
                print ("Cannot load image")
            }

            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            userImgDetail.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
        var user: User!
        let picture = Image(context: context)
        if let img = userImgDetail.image{
            if let data = UIImageJPEGRepresentation(img, 0.9){
            let fileManager = FileManager.default
            let imgName = "\(UUID()).jpg"
            let imgPaths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imgName)
            fileManager.createFile(atPath: imgPaths as String , contents: data, attributes: nil)
                picture.imageURL = imgName
        }
        }
        
        if userToEdit == nil {
            
            user = User(context: context)
            
        } else {
            
            user = userToEdit
            
        }
        
        user.toImage = picture
        
        if let username = usernameDetail.text {
            
            user.username = username
            
        }
        
        if let emails = emailDetail.text {
            
           user.email = emails
        }
        
        do{
            try context.save()
        }catch{
            print("Error")
        }
            print("\(user)")
        
        _ = navigationController?.popViewController(animated: true)

    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if userToEdit != nil {
            context.delete(userToEdit!)
            do{
                try context.save()
            }catch{
                print("Error")
            }

        }
        
        _ = navigationController?.popViewController(animated: true)
    }

}
