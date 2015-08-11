execute 'export HOMEBREW_CASK_OPTS' do
  command "export HOMEBREW_CASK_OPTS='--appdir=#{node[:brew][:install_path]}'"
  not_if node[:brew][:install_path]
end

include_recipe 'homebrew::package'
include_recipe 'homebrew::cask'

execute 'copy google-chrome to /Applications' do
  command 'cp -rf /opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app /Applications/'
  only_if 'ls /opt/homebrew-cask/Caskroom | grep google-chrome'
  not_if 'ls /Applications | grep Google\ Chrome.app'
end
