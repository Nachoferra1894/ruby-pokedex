class ApplicationController < ActionController::API
    include Pagy::Backend

    def paginate(records)
        pagy(records, items: params[:page_size] || 10)
    end

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET'])
    end
end
