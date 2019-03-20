class SequencesController < ApplicationController



def create

    @sequence = Sequence.new
    @sequence.year=Time.now.year
    @sequence.day=Time.now.day
    @sequence.number=1
    if !Sequence.exists?(year: Time.now.year, day: Time.now.day) 
        Sequence.delete_all
        if !@sequence.save 
            raise "error"
        end
    end

    redirect_to '/quality_controls'
end


end
