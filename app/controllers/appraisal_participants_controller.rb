class AppraisalParticipantsController < ApplicationController
    unloadable

    def index
    	@users = User
    	.where("login <> '' and login is not null")
    	.order('login')
      respond_to do |format|  
        format.json { 
          render :json => {
            :users => @users,
            :total => @users.count,
            :links => { :self => @users.current_page , :next => @userss.next_page}
            } 
        }
      end
    end
end
