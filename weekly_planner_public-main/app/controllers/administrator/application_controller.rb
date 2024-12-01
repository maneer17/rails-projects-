module Administrator
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin!
  end
end
