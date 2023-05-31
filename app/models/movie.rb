# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
has_many(:characters, {:class_name => "Character", :foreing_key => "movie_id"})
  def characters
  my_id = self.id

  return Character.where({:movie_id => my_id})
end 

  def director
    key = self.director_id

    matching_set = Director.where({ :id => key })

    the_one = matching_set.at(0)

   return the_one
  end
end
