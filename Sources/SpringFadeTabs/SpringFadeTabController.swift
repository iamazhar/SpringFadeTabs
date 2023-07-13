import UIKit

open class SpringFadeTabController: UITabBarController {
    private let feedbackGenerator = UISelectionFeedbackGenerator()
  
    override open func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        feedbackGenerator.prepare()
    }
}

extension SpringFadeTabController: UITabBarControllerDelegate  {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        feedbackGenerator.selectionChanged()
    }
  
    public func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SpringFadeTabBarTransitionAnimation(viewControllers: tabBarController.viewControllers)
    }
}

public class SpringFadeTabBarTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    private let transitionDuration: Double = 0.3
    private let viewControllers: [UIViewController]?
  
    public init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }
  
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    /// Animate the transition between from and to controllers views
    /// - Parameter transitionContext: The transition context object
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: .to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
        else {
            transitionContext.completeTransition(false)
            return
        }
    
        animateTransitionBetweenViews(using: transitionContext, fromView: fromView, toView: toView, fromIndex: fromIndex, toIndex: toIndex, frame: transitionContext.initialFrame(for: fromVC))
    }
  
    private func animateTransitionBetweenViews(using transitionContext: UIViewControllerContextTransitioning, fromView: UIView, toView: UIView, fromIndex: Int, toIndex: Int, frame: CGRect) {
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width/4 : frame.origin.x + frame.width/4
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width/4 : frame.origin.x - frame.width/4
        toView.frame = toFrameStart
        toView.alpha = 0.0
    
        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(
                withDuration: self.transitionDuration,
                delay: 0.0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 1.0,
                options: .curveEaseInOut
            ) {
                fromView.frame = fromFrameEnd
                toView.frame = frame
                fromView.alpha = 0.0
                toView.alpha = 1.0
            } completion: { success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            }
        }
    }
  
    private func getIndex(forViewController viewController: UIViewController) -> Int? {
        return viewControllers?.firstIndex(where: { $0 == viewController })
    }
}
