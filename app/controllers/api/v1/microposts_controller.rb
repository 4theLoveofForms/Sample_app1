module Api
  module V1
    class MicropostsController < ApiController
      def index
        @microposts = current_user.microposts.paginate(page: params[:page])
      end

      def show
        @micropost = Micropost.find(params[:id])
      end
    end
  end
end
