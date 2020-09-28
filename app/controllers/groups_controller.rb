require 'date'
class GroupsController < ApplicationController
  before_action :find_board, only: [:index, :create]
  before_action :find_group, only: [:edit, :update, :destroy]
  def index
    @groups = @board.groups.all.order(created_at: :desc)
    @workspace = @board.workspace_id
    @rooms = Room.all
    @room = @rooms.find_by(workspace_id: @workspace)
    @items = Item.all.order(created_at: :desc)
    @posts = Post.all
    @assignments = Assignment.all
    @workspace_find_user = @board.workspace
    @find_users = @workspace_find_user.users
    @online_users = @find_users.where("last_seen_at > ?", 2.minutes.ago)
    # byebug
  end
  def new
    @group = Group.new
  end
  def create
    @group = @board.groups.new(group_params)
    if @group.save
      redirect_to board_groups_path, notice: "新增成功"
    else
      render :new
    end    
  end

  def edit
  end

  def update
    
    if @group.update(group_params)
      redirect_to board_groups_path(@group.board), notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to board_groups_path(@group.board), notice: "刪除成功"
  end

  private
  def find_board
    @board = Board.find(params[:board_id])
  end
  def find_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name)
  end
end