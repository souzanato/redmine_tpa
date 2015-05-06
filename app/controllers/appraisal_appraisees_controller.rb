require 'will_paginate/array'

class AppraisalAppraiseesController < ApplicationController
    unloadable
    before_action :user_logged?

    def index
       	appraisees_hash = User.where("login <> '' and login is not null").order('login').to_a.map(&:serializable_hash)        
        appraisees_hash.each{|h| h.merge!(appraisee_info: "#{h["login"]} - #{h["firstname"]} #{h["lastname"]}")}
        appraisees_hash = appraisees_hash.paginate(:page => params[:page], :per_page => params[:page_limit])

        respond_to do |format|  
            format.json { 
              render :json => {
                :appraisees => appraisees_hash,
                :total => appraisees_hash.count,
                :links => { :self => appraisees_hash.current_page , :next => appraisees_hash.next_page}
                } 
            }
        end
    end

    private
    def user_logged?
        unless params[:user_logged] == 'true' or User.current.logged?
            redirect_to signin_path
        end
    end
end
