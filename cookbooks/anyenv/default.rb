node[:anyenv][:anyenv_root] += "/.anyenv"

include_recipe "anyenv::system"

node[:anyenv][:install_versions].each do |env_name, versions|
  versions.each do |ver|
    execute "#{env_name} install #{ver}" do
      command "#{anyenv_init} #{env_name} install #{ver}"
      not_if "#{anyenv_init} #{env_name} versions | grep #{ver}"
    end
  end
end
