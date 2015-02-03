class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :question_id, uniqueness: {scope: :user_id} # ---> checks for combined uniqueness of question_id and user_id
  
end
