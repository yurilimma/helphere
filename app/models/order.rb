class Order < ActiveRecord::Base
  belongs_to :ad
  belongs_to :member, class_name: "Member"

  #status
  enum status: [:requested, :waiting, :analysing, :paid, :avaliable, :dispute, :returned, :canceled, :debited, :temporary_retention]
end
