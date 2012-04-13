desc "Install to $HOME/.oh-my-zsh/custom/"
task :install do
  puts "*** Deploying to #{ENV['HOME']}/.oh-my-zsh/custom/ ***"
  system('rsync -vazC --delete --exclude .git --exclude example* custom/ ~/.oh-my-zsh/custom')
end
