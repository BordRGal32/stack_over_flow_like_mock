require 'spec_helper'

describe Answer do
  it{ should validate_presence_of :answer }
  it { should belong_to :post }
  it {should belong_to :user }

  describe '#mark_best_answer' do
    it 'marks an answers best_answer attribute as true ' do
      answer = Answer.create({:best_answer => false })
      answer.mark_best_answer
      answer.best_answer.should eq true
    end
  end
  describe '.remove_best_answer' do
    it 'it makes the best answer attribute false for all answers' do
      answer1 = Answer.create({:best_answer => true, :answer => "answer" })
      answer2 = Answer.create({:best_answer => false, :answer => "answer" })
       Answer.remove_best_answer
       Answer.all[0].best_answer.should eq false
    end
  end
end
