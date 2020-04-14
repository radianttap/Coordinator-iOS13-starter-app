import UIKit

extension UISceneSession {
	private struct AssociatedKeys {
		static var appDependency = "AppDependency"
		static var sceneCoordinator = "SceneCoordinator"
	}

	var appDependency: AppDependency? {
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.appDependency) as? AppDependency
		}
		set {
			objc_setAssociatedObject(self, &AssociatedKeys.appDependency, newValue, .OBJC_ASSOCIATION_COPY)
			sceneCoordinator?.appDependency = newValue
		}
	}

	weak var sceneCoordinator: SceneCoordinator? {
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.sceneCoordinator) as? SceneCoordinator
		}
		set {
			objc_setAssociatedObject(self, &AssociatedKeys.sceneCoordinator, newValue, .OBJC_ASSOCIATION_ASSIGN)
		}
	}
}
