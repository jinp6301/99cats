class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex, :user_id

  has_many :cat_rental_requests, dependent: :destroy

  validates :age, :birth_date, :color, :name, :sex, :user_id, presence: true
  validates :color, inclusion: {:in => %w(white red blue black brown green orange tortoiseshell), :message => "This is not a good color"}
end
