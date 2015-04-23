  class AppraisalsTemplatesController < ApplicationController
    unloadable

    def index
      @appraisals = Appraisal.where(template: true)
    end

    def show
    end

    def new    
      @appraisal = Appraisal.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
