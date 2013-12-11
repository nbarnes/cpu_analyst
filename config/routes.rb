CpuAnalyst::Application.routes.draw do

  root :to => 'static#index'

  get ':action' => 'static#:action'

end
