class ScoreController < ApplicationController
  def array_hash(array)
    h = {}
    array.each do |elem|
      if h.key?(elem)
        h[elem] += 1
      else
        h[elem] = 1
      end
    end
    h
  end

  def check
    word_hash = array_hash(params[:word].upcase.chars)
    grid_hash = array_hash(params[:grid].gsub(/"/, "").gsub("[", "").gsub("]", "").chars)
    word_hash.each do |key, value|
      return false if !(grid_hash.key?(key) && grid_hash[key] >= value)
    end
    true
  end

  def run_game
    end_time = Time.now
    score = 0
    message = ""
    time = (end_time - Time.parse(params[:start_time])).round(0)
    if !check
      score = 0
      message = "Not in the grid"
    else
      score = (params[:word].length * 100 - time).round(0)
      message = "Well done !!"
    end
    @result = { time: time, score: score, message: message }
  end

end
