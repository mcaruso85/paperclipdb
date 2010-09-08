ActionController::Routing::Routes.draw do |map|
  map.connect 'paperclipdb/*dir_name/:file_name.:format', :controller => 'paperclipdb/attachments', :action => 'get_attachment'
end
