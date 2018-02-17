class LedController < ApplicationController
before_action :check_login
def leader
    puts "leader"
    puts params[:id]
    scores = Score.where(subgenere_id: params[:id])
    puts scores
    arr = Array.new
    scores.each do |sco|
      obj = User.find_by(id: sco.user_id)
      arr1 = Array.new
      arr1 << obj.name
      arr1 << sco.score
      arr1 << obj.id
      arr << arr1
    end
    arr.sort_by!{ |a| a[1]}
    arr.reverse!
    render 'leader', :locals => {:arr => arr }
  end
end
 