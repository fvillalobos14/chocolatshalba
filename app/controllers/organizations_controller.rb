class OrganizationsController < ApplicationController
    def index
        @organizations=Organization.all
    end

    def show
        @organization=Organization.find(params[:id])
        @entries=@organization.entry_controls
    end    
end
