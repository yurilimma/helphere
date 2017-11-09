class Order < ActiveRecord::Base
  belongs_to :ad
  belongs_to :member

  #status
  enum status: [:requested, :waiting, :analysing, :paid, :avaliable, :dispute, :returned, :canceled, :debited, :temporary_retention]
end
