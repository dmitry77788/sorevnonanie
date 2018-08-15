require 'spec_helper'
  
RSpec.describe Komanda, type: :model do
  context 'primer' do
    it { is_expected.to validate_presence_of(:komanda) }
    end
  end
end