class ApplicationController < ActionController::API
    include Pagy::Backend

    def paginate(records)
        pagy(records, items: params[:page_size] || 10)
    end
end
