desc "Install to $HOME/.oh-my-zsh/custom/"
task :deploy do
  puts "*** Deploying to $HOME/.oh-my-zsh/custom/ ***"
  system('rsync -vazC --delete --exclude .git --exclude example* custom/ ~/.oh-my-zsh/custom')
end
