class DailyEntriesController < ApplicationController
  def new
    @daily_entry = DailyEntry.new
  end

  def create
    @daily_entry = DailyEntry.new entries_params
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
    @daily_entries = DailyEntry.all
  end

  private

  def entries_params
    params.require(:daily_entry).permit(:body, :prefix)
  end

  def find_entry
    DailyEntry.find(params[:id])
  end
end
