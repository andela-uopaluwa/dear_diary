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

  def index
    @daily_entries = DailyEntry.all
  end

  private

  def entries_params
    params.require(:daily_entry).permit(:body, :prefix)
  end
end
