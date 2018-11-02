class QualityControl < ApplicationRecord
  belongs_to :batch
  has_one :revision

  validates :code, presence: true
  validates :cut_at, presence: true
  validates :made_by, presence: true
  validates :observation, presence: true

  before_destroy :remove_results_revision
  before_save  :update_sequence

  def remove_results_revision
    Result.where(quality_control_id: id).destroy_all
    Revision.where(quality_control_id: id).destroy_all
  end

  def update_sequence
    @sequence=(Sequence.find_by(year: Time.current.year, day: Time.current.day))
    puts @sequence
    if @sequence != nil
      Sequence.update(@sequence.id, :number => @sequence.number+1)
    else
      seq = Sequence.new(:year => Time.current.year, :day => Time.current.day)
      puts @seq
      Seq.save
      @sequence = Seq

    end
  end
end
