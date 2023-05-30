import UIKit

private extension Double {
    static var durationForButtonClick: Double = 0.2
    static var scalesForButtonClick: Double = 0.9
}

private extension UIColor {
    static var topColor: UIColor = UIColor(red: 216.0/255.0, green: 197.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    static var bottomColor: UIColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
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
    
    func setGradientBackground() {
        let colorTop = UIColor.topColor.cgColor
        let colorBottom = UIColor.bottomColor.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
