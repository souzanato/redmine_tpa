require 'will_paginate/array'

class AppraisalAppraisersController < ApplicationController
    unloadable
    def index
       	appraisers_hash = User.where("login <> '' and login is not null").order('login').to_a.map(&:serializable_hash)        
        appraisers_hash.each{|h| h.merge!(appraiser_info: "#{h["login"]} - #{h["firstname"]} #{h["lastname"]}")}
        appraisers_hash = appraisers_hash.paginate(:page => params[:page], :per_page => params[:page_limit])

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
end
