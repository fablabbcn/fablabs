require 'spec_helper'

describe Discussion, type: :model do
  it { should belong_to(:discussable) }
  it { should belong_to(:creator) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:creator) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:discussable) }

  it "is valid" do
    expect(FactoryGirl.create(:discussion)).to be_valid
  end

  it "has to_s" do
    expect(FactoryGirl.build_stubbed(:discussion, title: 'Who am I?').to_s).to eq('Who am I?')
  end

  # it "has initial state" do
  #   expect(FactoryGirl.build(:discussion).current_state).to eq('open')
  # end
end
