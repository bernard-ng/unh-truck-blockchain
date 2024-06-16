# frozen_string_literal: true

module Admin
  class LogsController < ApplicationController
    # GET /logs
    def index
      @logs = Log.all
    end

    # GET /logs/new
    def new
      @log = Log.new
    end

    # POST /logs
    def create
      @log = Log.new(log_params)

      if @log.save
        redirect_to @log, notice: 'Order log was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:temperature, :quantity, :lat, :lng, :order_id)
    end
  end
end
