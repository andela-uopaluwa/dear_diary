class DailyEntriesController < ApplicationController
  def new
    @daily_entry = DailyEntry.new
  end

  def create
    @daily_entry = DailyEntry.new entries_params
    if @daily_entry.save
      render daily_entry_path
    else
      render plain: entries_params
    end
    
  end
  private

  def entries_params
    params.require(:daily_entry).permit(:body, :prefix)
  end
end
