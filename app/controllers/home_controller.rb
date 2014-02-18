class HomeController < ApplicationController

  def index
    @gists = Gist.visible.decorate

    render template: 'gists/index'
  end

end