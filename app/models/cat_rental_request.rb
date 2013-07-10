class CatRentalRequest < ActiveRecord::Base
  attr_accessible :begin_date, :cat_id, :end_date, :status

  belongs_to :cat

  validate :not_overlapping

  def not_overlapping
    requests = CatRentalRequest.find_by_status_and_cat_id('approved', cat_id)
    requests.each do |request|
      errors.add(:begin_date, "Your begin date is overlapping")if overlap?(request,begin_date)
      errors.add(:end_date, "Your end date is overlapping")if overlap?(request,end_date)
    end
  end

  def overlap?(request,date)
    (request.begin_date..request.end_date) === date
  end

  # def approve
#     CatRentalRequest.find(cat_id).status = 'approved'
# #   end
#
#   def deny
#     CatRentalRequest.find(cat_id).status = 'deny'
#   end

end
