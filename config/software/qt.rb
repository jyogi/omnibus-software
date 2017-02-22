name "qt"

default_version "4.8"

dependency "homebrew"

build do
  command "cd $( brew --prefix )"
  command "brew install qt"
  command "brew linkapps qt"
end
