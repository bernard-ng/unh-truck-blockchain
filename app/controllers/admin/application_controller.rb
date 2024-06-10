module Admin
  class ApplicationController < ::ApplicationController
    before_action :require_admin

    private
      def require_admin
        if current_user && current_user.role != "ADMIN"
          redirect_to root_url, alert: "Vous n'avez pas la permission d'accès à cette page"
        end
      end
  end
end
