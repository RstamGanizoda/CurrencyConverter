import UIKit

class mainViewController: UIViewController {
    
    @IBOutlet weak var syncButton: UIButton!
    
    @IBOutlet weak var firstCurrencyFlagImageView: UIImageView!
    @IBOutlet weak var secondCurrencyFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.setGradientBackground()
    }
    
    
    @IBAction func syncButtonPressed(_ sender: UIButton) {
        print("hello")
        syncButton.zoomInOut()
    }
  
    
}
