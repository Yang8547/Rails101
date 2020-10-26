class GroupsController < ApplicationController
    # only signined user can access
    before_action :authenticate_user! , only: [:new,:create,:edit, :update, :destroy]
    # only owner can edit/update/delete the specific group
    before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

    def index 
        @groups = Group.all
    end

    def new 
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        @group.user = current_user

        if(@group.save)
            redirect_to groups_path
        else
            render 'new'
        end
    end

    def show 
        @group = Group.find(params[:id])
        @posts = @group.posts
    end

    def edit 
        @group = Group.find(params[:id])
        
    end

    def update 
        @group = Group.find(params[:id])
        
        if @group.update(group_params)
            # notice == Convenience accessor for flash[:notice]
            redirect_to groups_path, notice: "Update Success"
        else
            render 'edit'
        end
    end

    def destroy
        @group = Group.find(params[:id])
        
        @group.destroy
        redirect_to groups_path, alert: "Group Deleted"
    end

    

    private

    # find group and check if the current user is the owner of the group
    def find_group_and_check_permission
        @group = Group.find(params[:id])
        if current_user != @group.user
            redirect_to root_path, alert: "You have no permission."
        end
    end

    def group_params
       params.require(:group).permit(:title, :description,:user_id)
    end
end
