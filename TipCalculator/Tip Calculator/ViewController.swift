//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var SplitSlider: UISlider!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var singleTipSlider: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.becomeFirstResponder()
    }
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    func calculateBill() {
        
        tipCalculator.tipPercentage = Double(tipSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (billField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
        
    }
    
    func updateUI () {
        totalLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        singleTipSlider.text = String(format: "$%0.2f", tipCalculator.tipAmount)
        let numberOfPeople: Int = Int(SplitSlider.value)
        eachLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    @IBAction func onTap(_ sender: Any) {
        
         view.endEditing(true)
    }
    
    
    @IBAction func tipSliderChanged(_ sender: Any) {
        
        tipLabel.text = String(format: "Tip: %02d%%", Int(tipSlider.value))
        calculateBill()
    }
    
    @IBAction func splitSliderValueChanged(_ sender: Any) {
        
        splitLabel.text = "Split: \(Int(SplitSlider.value))"
        calculateBill()
    }
    
    @IBAction func billFieldChanged(_ sender: Any) {
          
          calculateBill()
      }
}

