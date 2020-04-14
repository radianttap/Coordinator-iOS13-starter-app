import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	
	var coordinator: SceneCoordinator?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }
		
		let window = UIWindow(windowScene: windowScene)
		self.window = window
		
		let sceneCoordinator = SceneCoordinator(scene: scene, sceneDelegate: self)
		self.coordinator = sceneCoordinator

		window.rootViewController = sceneCoordinator.rootViewController

		window.makeKeyAndVisible()
		sceneCoordinator.start()
	}
}

