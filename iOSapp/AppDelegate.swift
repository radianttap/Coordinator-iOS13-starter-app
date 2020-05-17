import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
	///	Here add strong properties representing non-UI objects,
	///	that comprise KILS layers: services, data management, middleware (bussiness logic) etc
	

	///	Collector of various singleton instances in the app: services, middleware, data handlers etc.
	///
	///	Rebuild this instance anytime a new service/data/middleware entity is instantiated.
	var appDependency: AppDependency? {
		didSet {
			updateSceneDependencies()
		}
	}


	
	
	
	
	
	
	


	// MARK: Application Lifecycle

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		//	instantiate all services and middleware
		//	build and set AppDependency
		appDependency = AppDependency()
		
		//	On first app launch, UIKit creates default UISceneSession and skips the configurationForConnecting method below.
		//	Setting `appDependency` above will take care of that session.
		
		return true
	}


	
	

	// MARK: Scene Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		connectingSceneSession.appDependency = appDependency

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
}




private extension AppDelegate {
	func updateSceneDependencies() {
		let application = UIApplication.shared
		
		application.openSessions.forEach {
			$0.appDependency = appDependency
		}
	}
}
