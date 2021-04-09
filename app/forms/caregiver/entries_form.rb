class Caregiver::EntriesForm
  include ActiveModel::Model 

  attr_accessor :event, :approved, :canceled, :not_canceled

  def initialize(event)
    @event= event
  end

  def update_all(params)
    assign_attributes(params)
    save
  end

  private def assign_attributes(params)
    fp = params.require(:event).permit([ :approved, :not_approved, :canceled, :not_canceled])

    @approved = fp[:approved]
    @not_approved = fp[:not_approved]
    @canceled = fp[:canceled]
    @not_canceled = fp[:not_canceled]
  end

  private def save 
    approved_entry_ids = @approved.split(":").map(&:to_i)
    not_approved_entry_ids = @not_approved.split(":").map(&:to_i)
    canceled_entry_ids = @canceled.split(":").map(&:to_i)
    not_canceled_entry_ids = @not_canceled.split(":").map(&:to_i)

    ActiveRecord::Base.transaction do
      @event.entries.where(id: approved_entry_ids).update_all(approved: true) if approved_entry_ids.present?
      @event.entries.where(id: not_approved_entry_ids).update_all(approved: false) if not_approved_entry_ids.present?
      @event.entries.where(id: canceled_entry_ids).update_all(canceled: true) if canceled_entry_ids.present?
      @event.entries.where(id: not_canceled_entry_ids).update_all(canceled: false) if not_canceled_entry_ids.present?
    end
  end


end

