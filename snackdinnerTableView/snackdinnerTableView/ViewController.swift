//
//  ViewController.swift
//  snackdinnerTableView
//
//  Created by Mac on 03/11/1944 Saka.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    let arryColour:[UIColor] = [UIColor(red: 0, green: 0, blue: 1, alpha: 0.25),UIColor(red: 0, green: 0, blue: 1, alpha: 0.1)]
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var snackDinnerTableView: UITableView!
    var snacks : [String] = ["Samosa","Wadapav","Dosa","Patis"]
    var snacksImage : [String] = ["samosa","wadaPav","dosa","paties"]
    var dinner : [String] = ["Paneertikka","ShevBhaji","VegMaratha","Kajukari"]
    var dinnerImage : [String] = ["paneertikka","shevbhaji","vegMaratha","kajukari"]
    var snacksdetails :[String] = ["A samosa is a fried South Asian pastry with a savoury filling, including ingredients such as spiced potatoes, onions, and peas. It may take different forms, including triangular, cone, or half-moon shapes, depending on the  region.","Vada pav,  alternatively spelt wada pao, ( listen) is a vegetarian fast food dish native to the Indian state of Maharashtra. The dish consists of a deep fried potato dumpling placed inside a bread bun (pav) sliced almost in half through the middle.","The Best Source of Carbohydrates.Dosa is also a great source of healthy carbohydrates. As a result, your body is supplied with the necessary energy that you need to stay energetic throughout the day. So, if you are planning to shed some weight, dosa is the right breakfast option for you.","The versatile potato does it again! Delicious puff-pastry pockets filled with aromas of India taste like something that would take hours to make but it is super easy and one is not enough."]
    var dinnerdetails :[String] = ["Paneer tikka is an Indian dish made from chunks of paneer marinated in spices and grilled in a tandoor. It is a vegetarian alternative to chicken tikka and other meat dishes.It is a popular dish that is widely available in India and countries with an Indian diaspora.","Khandeshi Sev Bhaji Recipe is a flavor packed curry that is made with fried besan noodles which is soaked up in an onion and dry coconut curry. The curry will take some time to prepare as the onions are roasted well and then simmer to form a thin gravy.", "A Veg Maratha is a dish, which is very common in Maharashtra, India. It is prepared in each and every house in Maharashtra. It is categorized under the main course. It is generally spicy and tastes awesome. It is a combination of veg spicy koftas n spicy gravy prepared seperately. While serving we add the koftas in hot gravy.. Veg Maratha is eaten with paratha, roti, naan or any type of Indian bread.","Kaju curry is a restaurant style delicious recipe of a creamy kaju butter masala with a rich, tangy, sweet flavorful gravy made with cashews, tomatoes, cream and spices. Kaju is the Hindi word for cashews. This recipe of kaju masala has an overload of cashews as they are added twice during the cooking process. Serve with roti, naan, paratha or steamed rice for a sumptuous and filling lunch or dinner."]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        snackDinnerTableView.dataSource = self
        snackDinnerTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return snacks.count
        default:
            return dinner.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.snackDinnerTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if(indexPath.section == 0){
            cell.textLabel?.text = snacks[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 20.0)
            cell.imageView?.image = UIImage(named: snacksImage[indexPath.row])
            cell.backgroundColor = arryColour[indexPath.row % arryColour.count]
        }else{
            cell.textLabel?.text = dinner[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 20.0)
            cell.imageView?.image = UIImage(named: dinnerImage[indexPath.row])
            cell.backgroundColor = arryColour[indexPath.row % arryColour.count]
            }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.width, height:40))
        view.backgroundColor = .orange
       let label = UILabel(frame:CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        if (section == 0){
            label.text = "Snacks"
            label.font = .systemFont(ofSize: 30.0)
        }else {
            label.text = "Dinner"
            label.font = .systemFont(ofSize: 30.0)
        }
        view.addSubview(label)
        
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        switch indexPath.section {
        case 0:
            secondViewController.detail = snacksdetails[indexPath.row]
            secondViewController.image = UIImage(named:snacksImage[indexPath.row])
        default:
            secondViewController.detail = dinnerdetails[indexPath.row]
            secondViewController.image = UIImage(named:dinnerImage[indexPath.row])
        }
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

