class Caregiver::TopController  < Caregiver::Base
  def index
    @caregivers = Caregiver.order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end
end
