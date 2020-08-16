# == Schema Information
#
# Table name: effects
#
#  id                  :uuid             not null, primary key
#  detail              :text             not null
#  name                :text             not null
#  outcome             :enum
#  potency_thresholds  :decimal(4, 2)    not null, is an Array
#  time_per_ingredient :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe Effect, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
