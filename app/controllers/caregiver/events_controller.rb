class Caregiver::EventsController < Caregiver::Base 

  def index 
    @events = Event.order(application_start_time: :desc).page(params[:page])
    
    #@events = Event.joins(:entries).select("events. *, COUNT(entries.id) AS number_of_applicants").group("events.id").order(application_start_time: :desc).includes(:registrant).page(params[:page])
  end

  def new 
    @event = Event.new
  end

  def create 
    @event = Event.new
    @event.assign_attributes(event_params)
    @event.registrant_id = current_caregiver_member.id
    if @event.save!
      flash.notice = "イベントを登録しました。"
      redirect_to action: :index
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def update 
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)
    if @event.save
      flash.notice = "イベントを更新しました。"
      redirect_to action: :index
    else
      flash.now.alert = "入力に誤りがあります。"
      render :edit
    end
  end

  def show 
    @event = Event.find(params[:id])
  end

  def edit 
    @event = Event.find(params[:id])
    @event.init_visual_attributes
  end

  def destroy
    event = Event.find(params[:id])
    if event.deletable?
      event.destroy!
      flash.notice = "イベントを削除しました。"
   else
      flash.alert = "このイベントは削除できません"
   end
    redirect_to action: :index
  end

  private 
  def event_params
    params.require(:event).permit([ :title, :application_start_date, :application_start_hour, :application_start_minute, :application_end_date, :application_end_hour, :application_end_minute, :min_number_of_participants, :max_number_of_participants, :description])
  end

end
