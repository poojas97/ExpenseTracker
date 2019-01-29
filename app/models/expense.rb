class Expense <ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    def act
        categories = Category.where(user_id: user_id).pluck(:id)
    end

 
  validates :name, presence: true, length: { minimum: 3, maximum: 50} 
  validates :amount, presence: true, numericality: true
  validates_date :date, :on_or_before => lambda { Date.today}
  validates :user_id, presence: true, numericality: true
  validates_inclusion_of :category_id, in: :act
   


  


end