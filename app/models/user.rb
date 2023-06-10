# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# email:string
# password_digest:string
#
# password: string virtual
# password_confirmation: string virtual
class User < ApplicationRecord
  has_secure_password
  has_one :fixed_cost, dependent: :destroy
  has_many :employment_contracts, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Gib eine valide Mail Adresse an." }

  after_create do
    self.create_fixed_cost
  end

  def budget
    self.employment_contracts.map(&:monthly_netto_salary).sum - fixed_cost.sum
  end

  def netto_salary_sum
    self.employment_contracts.map(&:monthly_netto_salary).sum
  end
end
