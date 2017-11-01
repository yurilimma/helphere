class Member < ActiveRecord::Base
	#classificacao, quem vai avaliar
	ratyrate_rater

	#associations
	has_many :ads
	has_one :profile_member
	accepts_nested_attributes_for :profile_member

	#Validations
	validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def nested_attributes
  	if nested_attributes_blank?
  		errors.add(:base, "Nome e Telefone não podem ficar em branco")
  	end
  end
  def nested_attributes_blank?
  	profile_member.first_name.blank? || profile_member.phone.blank?
  	
  end
end
