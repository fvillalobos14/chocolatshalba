class OrganizationsController < ApplicationController
	before_action :authenticate_user!
    def index
        @organizations=Organization.all
    end

    def show
        @organization=Organization.find(params[:id])
        @entries=@organization.entry_controls
    end    
end
