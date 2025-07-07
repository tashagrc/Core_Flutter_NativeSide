target 'Core_Flutter_NativeSide' do
  use_frameworks!
  
  flutter_application_path = '../core_flutter_flutterside'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
  
  install_all_flutter_pods(flutter_application_path)
end


post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
end
