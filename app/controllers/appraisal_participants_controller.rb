require 'will_paginate/array'

class AppraisalParticipantsController < ApplicationController
    unloadable

    def index
       	users_hash = User.where("login <> '' and login is not null").order('login').to_a.map(&:serializable_hash)        
        users_hash.each{|h| h.merge!(participant_info: "#{h["login"]} - #{h["firstname"]} #{h["lastname"]}")}
        # users_hash = User.all
        users_hash = users_hash.paginate(:page => params[:page], :per_page => params[:page_limit])

        respond_to do |format|  
            format.json { 
              render :json => {
                :participants => users_hash,
                :total => users_hash.count,
                :links => { :self => users_hash.current_page , :next => users_hash.next_page}
                } 
            }
        end
    end
end
