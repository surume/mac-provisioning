ANYENV_PATH = "#{ENV['HOME']}/.anyenv"

git ANYENV_PATH do
  repository "https://github.com/riywo/anyenv"
end

git "#{ANYENV_PATH}/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update.git"
end

directory "#{ANYENV_PATH}/envs"

execute "install exenv" do
  command "#{ANYENV_PATH}/bin/anyenv install -f exenv"
  not_if "type exenv"
end
