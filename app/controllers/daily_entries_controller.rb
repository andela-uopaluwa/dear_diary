class DailyEntriesController < ApplicationController
  before_filter :authorize, only: [:destroy]

  def new
    @daily_entry = DailyEntry.new
  end

  def edit
    @daily_entry = find_entry
  end

  def create
    @daily_entry = DailyEntry.new entries_params
    @daily_entry.user_id = current_user.id

    if @daily_entry.save
      redirect_to @daily_entry
    else
      render 'new'
    end
  end

  def show
    @daily_entry = find_entry
  end

  def index
    @daily_entries = DailyEntry.owned_by_user current_user.id
  end

  def update
    @daily_entry = find_entry

    if @daily_entry.update entries_params
      redirect_to @daily_entry
    else
      render 'edit'
    end
  end

  def destroy
    @daily_entry = find_entry
    @daily_entry.destroy

    redirect_to daily_entries_path
  end

  private
  # TODO handle no record found errors and display something to the user
  def entries_params
    params.require(:daily_entry).permit(:body, :prefix)
  end

  def find_entry
    DailyEntry.owned_by_user(current_user.id).find(params[:id])
  end
end
