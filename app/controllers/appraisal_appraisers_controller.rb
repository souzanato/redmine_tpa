require 'will_paginate/array'

class AppraisalAppraisersController < ApplicationController
    unloadable
    before_action :user_logged?

    def index
       if params[:q]
            appraisers_hash = User
                .where("login <> '' and login is not null")
                .where("LOWER(concat(users.firstname, users.lastname)) like \"%#{params[:q].downcase}%\" or LOWER(users.login) like \"%#{params[:q].downcase}%\"")
                .order('login')
                .to_a
                .map(&:serializable_hash)        
            appraisers_hash.each{|h| h.merge!(appraiser_info: "#{h["login"]} - #{h["firstname"]} #{h["lastname"]}")}
            appraisers_hash = appraisers_hash.paginate(:page => params[:page], :per_page => params[:page_limit])
       end

        respond_to do |format|  
            format.json { 
              render :json => {
                :appraisers  => appraisers_hash,
                :total => appraisers_hash.count,
                :links => { :self => appraisers_hash.current_page , :next => appraisers_hash.next_page}
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
