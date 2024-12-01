class ApplicationController < ::ApplicationController
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_student!
  active_devise = current_student || current_teacher

end

