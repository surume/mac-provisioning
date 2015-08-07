ANYENV_PATH = "#{ENV['HOME']}/.anyenv"

include_recipe '../anyenv/default.rb'

execute "install rbenv" do
  command "#{ANYENV_PATH}/bin/anyenv install -f rbenv"
  not_if "type rbenv"
end
