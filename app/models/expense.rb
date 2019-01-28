class Expense <ActiveRecord::Base
    belongs_to :user
    belongs_to :category



    @category = Category.all
     a=[]
    @category.each do |c|
      a.push(c.id)
    end
     # :inclusion => { :in => proc { |record| record.all_codes } }
    puts "\n\n\n\n\n\n #{a} "

  # VALID_NAMES =  (3)
  validates :name, presence: true, length: { minimum: 3, maximum: 50} 
  validates :amount, presence: true, numericality: true
  validates_date :date, :on_or_before => lambda { Date.today}
  validates :user_id, presence: true, numericality: true
   validates :category_id, presence: true,numericality: true , inclusion: {in:  a   }
  # (user.categories.map(&:id))

   


  


end