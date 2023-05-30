import UIKit


private extension Double {
    
    static var durationForButtonClick: Double = 0.2
    static var scalesForButtonClick: Double = 0.9
}
class mainViewController: UIViewController {
    
    @IBOutlet weak var syncButton: UIButton!
    
    @IBOutlet weak var firstCurrencyFlagImageView: UIImageView!
    @IBOutlet weak var secondCurrencyFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        
    }
    
    
    @IBAction func syncButtonPressed(_ sender: UIButton) {
        print("hello")
        syncButton.zoomInOut()
    }
    
    
}

extension UIView {
    func zoomInOut(duration: TimeInterval = .durationForButtonClick) {
        UIView.animate(
            withDuration: duration,
            delay: .zero,
            options: .curveLinear,
            animations: {
            self.transform = CGAffineTransform(scaleX: CGFloat(.scalesForButtonClick),
                                               y: CGFloat(.scalesForButtonClick))
            },
            completion: { _ in
                UIView.animate(
                    withDuration: duration,
                    delay: .zero,
                    options: .curveLinear
                ){
                    self.transform = CGAffineTransform.identity
                }
            })
    }
}
