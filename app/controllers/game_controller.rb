class GameController < ApplicationController
  def generate_grid
    arr = []
    8.times do
      arr << ('a'..'z').to_a.sample.upcase
    end
    arr << ['A', 'E', 'I', 'O', 'U', 'Y'].sample
    @grid = arr
    @start_time = Time.now
  end
end
