require 'pry'
class Answer < ActiveRecord::Base
  validates :answer, presence: true
  belongs_to :user
  belongs_to :post

    def  mark_best_answer
      self.update(:best_answer => true)
    end
    def self.remove_best_answer
      Answer.all.each do |answer|
        if answer.best_answer == true
          answer.update(:best_answer => false)
        end
      end
    end
  end
