import UIKit

final class SceneCoordinator: NavigationCoordinator, NeedsDependency {
	private weak var scene: UIScene!
	private weak var sceneDelegate: SceneDelegate!

	init(scene: UIScene, sceneDelegate: SceneDelegate) {
		self.scene = scene
		self.sceneDelegate = sceneDelegate
		
		let nc = UINavigationController()
		super.init(rootViewController: nc)

		appDependency = scene.session.appDependency
		scene.session.sceneCoordinator = self
	}

	override var coordinatingResponder: UIResponder? {
		return sceneDelegate
	}
	
	///	Collector of various singleton instances in the app: services, middleware, data handlers etc.
	///
	///	Rebuild this instance anytime a new service/data/middleware entity is instantiated.
	var appDependency: AppDependency? {
		didSet {
			updateChildCoordinatorDependencies()
			processQueuedMessages()
		}
	}

	override func start(with completion: @escaping () -> Void = {}) {
		super.start(with: completion)
		
		displayContent()
	}
	
}

private extension SceneCoordinator {
	func displayContent() {
		let vc = FirstController()
		show(vc)
	}
}
