module Api
    module V1
        class UrlsController < ApplicationController
            def check_if_exist(query)
                return Url.find_by(url: query)
            end

            def create
                @url = check_if_exist(params[:url])
                if @url
                    render json: @url
                else
                    @url = Url.new(url: params[:url])
                    @url.create_hash()
                    if @url.save
                        render json: @url, status: :created
                    else
                        render json: @url.errors, status: :unprocessable_entity
                    end
                end
            end

            def index
                if params[:url] == nil
                    render json: Url.all
                else
                    @url = Url.find_by(url: params[:url])
                    render json: @url
                end
            end
        end
    end
end